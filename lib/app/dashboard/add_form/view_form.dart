import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_projects/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_projects/common/networking/api_url.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../../../common/utils/constants/colors.dart';
import '../models/get_all_app_model.dart';
import 'ImagePreviewScreen.dart';
class AppChecker {
  static const MethodChannel _channel = MethodChannel('apk_channel');

  /// Checks if an app is installed using the specified package name.
  static Future<bool> isAppInstalled(String packageName) async {
    try {
      final bool result = await _channel.invokeMethod(
        'isAppInstalled',
        {'packageName': packageName},
      );
      return result;
    } catch (e) {
      print('Error checking app: $e');
      return false;
    }
  }
}
class ViewForm extends StatefulWidget {
  static const String route = '/view_form';
  final GetForm? getForm;

  const ViewForm({super.key, this.getForm});

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> with WidgetsBindingObserver{
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  CancelToken? _cancelToken;
  bool _isAppInstalled = false;
  static const platform = MethodChannel('apk_channel');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkAppInstalledStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkAppInstalledStatus();
    }
  }

  Future<bool> isAppInstalled(String packageName) async {
    try {
      final bool isInstalled =
      await platform.invokeMethod('isAppInstalled', {'packageName': packageName});
      print('Is installed: $packageName');
      return isInstalled;
    } catch (e) {
      print("Error checking app installed: $e");
      return false;
    }
  }

  Future<bool> openApp(String packageName) async {
    try {
      final result = await platform.invokeMethod('openApp', {'packageName': packageName});
      print("App launch result: $result");
      return true;
    } catch (e) {
      print("Error launching app: $e");
      return false;
    }
  }

  Future<void> checkAppInstalledStatus() async {
    final packageName = widget.getForm?.packageName ?? '';
    print("Checking if package is installed: $packageName");
    final installed = await isAppInstalled(packageName);
    setState(() {
      _isAppInstalled = installed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            print("_isAppInstalled: $_isAppInstalled");

            /// Installs an APK from the given content URI path.
            Future<void> installApkWithContentUri(String apkPath) async {
              try {
                print("Attempting to install APK from path: $apkPath");
                await platform.invokeMethod('installApk', {'apkPath': apkPath});
                print("Installation intent launched successfully");
              } catch (e) {
                print("Platform exception during installation: $e");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Installation error: ${e}")),
                );
              }
            }

            /// Downloads an APK from a URL and installs it.
            Future<void> downloadAndInstallApk(
                BuildContext context,
                String apkUrl,
                String appName,
                ) async {
              try {
                print("Starting download for: $appName from $apkUrl");

                final dir = await getExternalStorageDirectory();
                if (dir == null) throw Exception("Could not access storage directory");

                final timestamp = DateTime.now().millisecondsSinceEpoch;
                final fileName = '${appName.replaceAll(RegExp(r'[^\w\s-]'), '_')}_$timestamp.apk';
                final filePath = '${dir.path}/$fileName';
                _cancelToken = CancelToken();

                setState(() {
                  _isDownloading = true;
                  _downloadProgress = 0.0;
                });

                final dio = Dio();
                await dio.download(
                  apkUrl,
                  filePath,
                  cancelToken: _cancelToken,
                  onReceiveProgress: (received, total) {
                    if (total != -1) {
                      setState(() {
                        _downloadProgress = received / total;
                      });
                      print("Download progress: ${(received / total * 100).floor()}%");
                    }
                  },
                );

                final file = File(filePath);
                if (!await file.exists() || await file.length() == 0) {
                  throw Exception("Downloaded file is empty or not found");
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Download complete. Installing...")),
                );

                await installApkWithContentUri(filePath);
                await Future.delayed(const Duration(seconds: 2));
                await checkAppInstalledStatus();
              } catch (e) {
                if (e is DioError && CancelToken.isCancel(e)) {
                  debugPrint("Download cancelled");
                } else {
                  print("Error during download/install: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: $e")),
                  );
                }
              } finally {
                setState(() {
                  _isDownloading = false;
                  _downloadProgress = 0.0;
                  _cancelToken = null;
                });
              }
            }

            /// Checks and requests permissions needed for downloading and installing APKs.
            Future<bool> checkAndRequestPermissions() async {
              final androidInfo = await DeviceInfoPlugin().androidInfo;
              final androidVersion = int.tryParse(androidInfo.version.release ?? '0') ?? 0;

              bool hasStoragePermission = false;
              bool hasInstallPermission = false;

              if (androidVersion >= 13) {
                final permissions = await [
                  Permission.photos,
                  Permission.videos,
                  Permission.audio
                ].request();

                hasStoragePermission = permissions.values
                    .every((status) => status.isGranted);
              } else {
                final status = await Permission.storage.request();
                hasStoragePermission = status.isGranted;
              }

              final installStatus = await Permission.requestInstallPackages.request();
              hasInstallPermission = installStatus.isGranted;

              return hasStoragePermission && hasInstallPermission;
            }
            // Determine if we're on a mobile device or web
            bool isMobile = constraints.maxWidth < 600;
            return Center(
              child: Container(
                // Constrain max width on web to prevent stretching
                constraints: BoxConstraints(maxWidth: 1200),
                color: AppColors.lightBgColor,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // App Icon
                            Container(
                                padding: EdgeInsets.all(isMobile ? 16 : 24),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // App Icon
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // App Icon with optional blur/fade
                                          Container(
                                            width: isMobile ? 80 : 100,
                                            height: isMobile ? 80 : 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "${widget?.getForm?.appIcon}",
                                                ),
                                                fit: BoxFit.cover,
                                                colorFilter: _isDownloading
                                                    ? ColorFilter.mode(
                                                        Colors.white
                                                            .withOpacity(0.5),
                                                        BlendMode.srcATop,
                                                      )
                                                    : null,
                                              ),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),

                                          // Progress Indicator on top of icon when downloading
                                          if (_isDownloading)
                                            SizedBox(
                                              width: isMobile ? 40 : 50,
                                              height: isMobile ? 40 : 50,
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.white,
                                                value: _downloadProgress,
                                                strokeWidth: 5,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ])),
                            SizedBox(width: isMobile ? 16 : 24),
                            // App Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.getForm?.appName ?? '-',
                                    style: TextStyle(
                                      fontSize: isMobile ? 24 : 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    _isDownloading
                                        ? "Downloading... ${(_downloadProgress * 100).toStringAsFixed(0)}%"
                                        : (widget.getForm?.appDescription ??
                                            '-'),
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pop(true);
                              },
                              child: Container(
                                width: isMobile ? 50 : 50,
                                height: isMobile ? 34 : 50,
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  color: AppColors.lightPrimaryColor
                                      .withOpacity(0.2),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black26,
                                  //     blurRadius: 4,
                                  //     offset: Offset(2, 2),
                                  //   ),
                                  // ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: isMobile ? 20 : 26,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // Stats Section with Responsive Layout
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 16 : 24,
                          horizontal: isMobile ? 16 : 32,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            // alignment: WrapAlignment.spaceEvenly,
                            spacing: isMobile ? 30 : 40,
                            // runSpacing: 16,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem(
                                icon: Icons.star,
                                value: widget.getForm?.ratings.toString() ?? '',
                                label: '12 reviews',
                                isMobile: isMobile,
                              ),
                              // if (!isMobile)
                              _buildDivider(),
                              _buildStatItem(
                                icon: Icons.download,
                                value:
                                    "${widget.getForm?.sizeMb.toString() ?? '-'} MB",
                                label: 'Size',
                                isMobile: isMobile,
                              ),
                              // if (!isMobile)
                              _buildDivider(),
                              _buildStatItem(
                                icon: Icons.verified_user_outlined,
                                value: widget.getForm?.rated ?? '-',
                                label: 'Rated',
                                isMobile: isMobile,
                              ),
                              _buildDivider(),
                              _buildStatItem(
                                icon: Icons.dashboard_outlined,
                                value: widget.getForm?.rated ?? '-',
                                label: 'Downloads',
                                isMobile: isMobile,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Install Button
                      Container(
                          height: isMobile ? 40 : 50,
                          width: isMobile ? double.infinity : 400,
                          margin: EdgeInsets.symmetric(
                            horizontal: isMobile ? 30 : 0,
                            vertical: isMobile ? 8 : 16,
                          ),
                          child:ElevatedButton(
                            onPressed: ()
                            async {
                              if (_isAppInstalled) {
                                // Open the app if installed
                                final packageName = widget.getForm?.packageName; // Ensure `packageName` is available
                                if (packageName != null && packageName.isNotEmpty) {
                                  bool launched = await openApp(packageName);
                                  if (!launched) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Could not open the app.")),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Package name not found.")),
                                  );
                                }
                              } else {
                                if (_isDownloading) {
                                  _cancelToken?.cancel();
                                } else {
                                  print("Install button pressed");
                                  final selectedData = widget.getForm;
                                  final apkUrl = "${selectedData?.apkFile ?? ''}";
                                  print('APK URL: $apkUrl');

                                  final hasPermissions = await checkAndRequestPermissions();
                                  if (hasPermissions) {
                                    print("Permissions granted, proceeding with download");
                                    await downloadAndInstallApk(
                                      context,
                                      apkUrl,
                                      selectedData?.appName ?? 'app',
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Required permissions not granted. Please grant permissions in settings and try again.",
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.blue.shade100,
                              backgroundColor:
                              AppColors.lightPrimaryColor.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                vertical: isMobile ? 8 : 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              _isAppInstalled
                                  ? "Open"
                                  : _isDownloading
                                  ? "Cancel"
                                  : "Install",
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          )
                      ),

                      // Preview Images with Responsive Grid
                      Container(
                        height: isMobile ? 300 : 380,
                        child: isMobile
                            ? _buildMobilePreviewList()
                            : _buildWebPreviewGrid(constraints.maxWidth),
                      ),
                      Divider(
                        color: AppColors.greyColor.withOpacity(0.20),
                      ),
                      // About Section
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 24),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About this app',
                              style: TextStyle(
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: isMobile ? 8 : 16),
                            Text( widget.getForm != null ?
                              '${widget.getForm?.longDescription}':'India\'s trusted online platform for Applications.',
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 18,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Category Chips with Wrap
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 24),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildCategoryChip(
                                widget.getForm?.category ?? '-', isMobile),
                            // _buildCategoryChip('Business', isMobile),
                            // _buildCategoryChip('Productivity', isMobile),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? null : 160,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: isMobile ? 24 : 32,
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 24,
      width: 1,
      color: Colors.black.withOpacity(0.2),
    );
  }

  Widget _buildMobilePreviewList() {
    // List to store available screenshots
    List<String> screenshots = [];

    // Add screenshots if they exist and are not empty
    if (widget.getForm?.screenshot1 != null &&
        widget.getForm!.screenshot1!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot1!);
    }
    if (widget.getForm?.screenshot2 != null &&
        widget.getForm!.screenshot2!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot2!);
    }
    if (widget.getForm?.screenshot3 != null &&
        widget.getForm!.screenshot3!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot3!);
    }
    if (widget.getForm?.screenshot4 != null &&
        widget.getForm!.screenshot4!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot4!);
    }
    if (widget.getForm?.screenshot5 != null &&
        widget.getForm!.screenshot5!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot5!);
    }

    return screenshots.isEmpty
        ? Center(child: Text('No screenshots available'))
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16),
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12),
                child: _buildPreviewImage(screenshots[index], true, index),
              );
            },
          );
  }

  Widget _buildWebPreviewGrid(double maxWidth) {
    // List to store available screenshots
    List<String> screenshots = [];

    // Add screenshots if they exist and are not empty
    if (widget.getForm?.screenshot1 != null &&
        widget.getForm!.screenshot1!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot1!);
    }
    if (widget.getForm?.screenshot2 != null &&
        widget.getForm!.screenshot2!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot2!);
    }
    if (widget.getForm?.screenshot3 != null &&
        widget.getForm!.screenshot3!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot3!);
    }
    if (widget.getForm?.screenshot4 != null &&
        widget.getForm!.screenshot4!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot4!);
    }
    if (widget.getForm?.screenshot5 != null &&
        widget.getForm!.screenshot5!.isNotEmpty) {
      screenshots.add(widget.getForm!.screenshot5!);
    }

    return screenshots.isEmpty
        ? Center(child: Text('No screenshots available'))
        : GridView.builder(
            padding: EdgeInsets.all(24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // crossCount: maxWidth > 1000 ? 4 : 3,
              childAspectRatio: 16 / 9,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16, crossAxisCount: maxWidth > 1000 ? 4 : 3,
            ),
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              return _buildPreviewImage(screenshots[index], false, index);
            },
          );
  }

  Widget _buildPreviewImage(String imagePath, bool isMobile, int index) {
    return Hero(
      tag: "image_$index",
      child: GestureDetector(
        onTap: () {
          // Get all available screenshots
          List<String> screenshots = [];
          if (widget.getForm?.screenshot1 != null &&
              widget.getForm!.screenshot1!.isNotEmpty) {
            screenshots.add(widget.getForm!.screenshot1!);
          }
          if (widget.getForm?.screenshot2 != null &&
              widget.getForm!.screenshot2!.isNotEmpty) {
            screenshots.add(widget.getForm!.screenshot2!);
          }
          if (widget.getForm?.screenshot3 != null &&
              widget.getForm!.screenshot3!.isNotEmpty) {
            screenshots.add(widget.getForm!.screenshot3!);
          }
          if (widget.getForm?.screenshot4 != null &&
              widget.getForm!.screenshot4!.isNotEmpty) {
            screenshots.add(widget.getForm!.screenshot4!);
          }
          if (widget.getForm?.screenshot5 != null &&
              widget.getForm!.screenshot5!.isNotEmpty) {
            screenshots.add(widget.getForm!.screenshot5!);
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImagePreviewScreen(
                imageUrls: screenshots,
                initialIndex: index,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: isMobile ? 200 : double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: CachedNetworkImage(
              imageUrl: "$imagePath",
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error_outline, color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isMobile) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: isMobile ? 12 : 14,
          color: Colors.black,
        ),
      ),
      backgroundColor: AppColors.lightPrimaryColor.withOpacity(0.1),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 8 : 12,
      ),
    );
  }
}
