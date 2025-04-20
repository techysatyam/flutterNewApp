import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newwhhrrr/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:newwhhrrr/common/networking/api_url.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../../../common/utils/constants/colors.dart';
import '../models/get_all_app_model.dart';
import 'ImagePreviewScreen.dart';

class ViewForm extends StatefulWidget {
  static const String route = '/view_form';
  final GetForm? getForm;

  const ViewForm({super.key, this.getForm});

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  CancelToken? _cancelToken;


  static const platform = MethodChannel('apk_channel');

  Future<bool> isAppInstalled(String packageName) async {
    try {
      final bool result = await platform.invokeMethod('isAppInstalled', {'package': packageName});
      return result;
    } catch (e) {
      print('Error checking app installation: $e');
      return false;
    }
  }
  Future<void> installApkWithContentUri(String apkPath) async {
    try {
      print("Attempting to install APK from path: $apkPath");
      await platform.invokeMethod('installApk', {'apkPath': apkPath});
      print("Installation intent launched successfully");
    } on PlatformException catch (e) {
      print("Platform exception during installation: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Installation error: ${e.message}")),
      );
    }
  }

  Future<void> downloadAndInstallApk(
      BuildContext context, String apkUrl, String appName) async {
    try {
      print("Starting download process for: $appName");
      print("Download URL: $apkUrl");

      // Get the download directory
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        print("Could not access storage directory");
        throw Exception("Could not access storage directory");
      }

      print("Storage directory: ${dir.path}");

      // Create a unique filename with timestamp
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName =
          '${appName.replaceAll(RegExp(r'[^\w\s-]'), '_')}_$timestamp.apk';
      final filePath = '${dir.path}/$fileName';
      _cancelToken = CancelToken();

      if (mounted) {
        setState(() {
          _isDownloading = true;
          _downloadProgress = 0.0;
        });
      }

      print("Will save APK to: $filePath");

      // Download the file
      print("Starting download...");
      final dio = Dio();
      await dio.download(
        apkUrl,
        filePath,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).floor();
            print("Download progress: $progress%");
            setState(() {
              _downloadProgress = received / total;
            });
          }
        },
      );
      print("Download completed");

      // Verify the file exists and has content
      final file = File(filePath);
      if (!await file.exists()) {
        print("Downloaded file not found at: $filePath");
        throw Exception("Downloaded file not found");
      }

      final fileSize = await file.length();
      print("Downloaded file size: $fileSize bytes");

      if (fileSize == 0) {
        print("Downloaded file is empty");
        throw Exception("Downloaded file is empty");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Download complete. Installing..."),
          duration: Duration(seconds: 3),
        ),
      );

      // Install the APK using the platform channel
      print("Initiating installation...");
      await installApkWithContentUri(filePath);
      print("Installation process completed");

      // ✅ Check again if the app is now installed, and update UI
      await checkIfAppInstalled(); // <-- this is the key addition

    } catch (e) {
      if (e is DioError && CancelToken.isCancel(e)) {
        debugPrint("Download cancelled");
      } else {
        print("Error during download or installation: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            duration: Duration(seconds: 5),
          ),
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


  Future<bool> checkAndRequestPermissions() async {
    final DeviceInfoPlugin info = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await info.androidInfo;
    debugPrint('Android version: ${androidInfo.version.release}');
    final versionParts = androidInfo.version.release.split('.');
    final int androidVersion = int.tryParse(versionParts.first) ?? 0;
    // final int androidVersion = int.parse(androidInfo.version.release);

    print("Checking permissions for Android $androidVersion");

    // First check if we already have the permissions
    bool hasStoragePermission = false;
    bool hasInstallPermission = false;

    if (androidVersion >= 13) {
      // For Android 13+, we need media permissions
      final photosStatus = await Permission.photos.status;
      final videosStatus = await Permission.videos.status;
      final audioStatus = await Permission.audio.status;

      print(
          "Current media permissions - Photos: $photosStatus, Videos: $videosStatus, Audio: $audioStatus");

      hasStoragePermission = photosStatus.isGranted ||
          videosStatus.isGranted ||
          audioStatus.isGranted;
    } else {
      // For Android < 13, we need storage permission
      final storageStatus = await Permission.storage.status;
      print("Current storage permission: $storageStatus");
      hasStoragePermission = storageStatus.isGranted;
    }

    // Check install packages permission
    final installStatus = await Permission.requestInstallPackages.status;
    print("Current install packages permission: $installStatus");
    hasInstallPermission = installStatus.isGranted;

    // If we don't have all required permissions, request them
    if (!hasStoragePermission || !hasInstallPermission) {
      print("Requesting missing permissions...");

      if (androidVersion >= 13) {
        // Request media permissions for Android 13+
        final request = await [
          Permission.photos,
          Permission.videos,
          Permission.audio,
        ].request();

        print("Media permission results: ${request.toString()}");
        hasStoragePermission = request.values
            .every((status) => status == PermissionStatus.granted);
      } else {
        // Request storage permission for Android < 13
        final status = await Permission.storage.request();
        print("Storage permission result: ${status.toString()}");
        hasStoragePermission = status.isGranted;
      }

      // Request install packages permission if needed
      if (!hasInstallPermission) {
        final status = await Permission.requestInstallPackages.request();
        print("Install packages permission result: ${status.toString()}");
        hasInstallPermission = status.isGranted;
      }
    }

    // If we still don't have all permissions, open app settings
    if (!hasStoragePermission || !hasInstallPermission) {
      print(
          "Still missing permissions after request, opening app settings");
      await openAppSettings();
      return false;
    }

    print("All required permissions are granted");
    return true;
  }
  bool isInstalled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfAppInstalled();
    });
  }

  Future<bool> checkIfAppInstalled() async {
    final result = await isAppInstalled("com.example.targetapp");
    setState(() {
      isInstalled = result;
    });
    return result; // ✅ This is the new line you need to add
  }

  void openApp(String packageName) async {
    try {
      await platform.invokeMethod('openApp', {'package': packageName});
    } catch (e) {
      print("Failed to open app: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
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
                                                  "${ApiUrl.base}${widget.getForm?.appIcon ?? '-'}",
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
                      Text('isInstalled = $isInstalled'),
                      // Install Button
                      Container(
                        height: isMobile ? 40 : 50,
                        width: isMobile ? double.infinity : 400,
                        margin: EdgeInsets.symmetric(
                          horizontal: isMobile ? 30 : 0,
                          vertical: isMobile ? 8 : 16,
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (isInstalled) {
                              openApp("com.example.targetapp");
                            } else{
                              if (_isDownloading) {
                                _cancelToken?.cancel();
                              } else {
                                print("Install button pressed");
                                final selectedData = widget.getForm;
                                final apkUrl =
                                    "${ApiUrl.download}${selectedData?.apkFile ?? ''}";
                                print('APK URL: $apkUrl');

                                // Check and request permissions
                                final hasPermissions =
                                    await checkAndRequestPermissions();

                                if (hasPermissions) {
                                  print(
                                      "Permissions granted, proceeding with download");
                                  // Use appName instead of apkName since apkName doesn't exist in GetForm
                                  await downloadAndInstallApk(context, apkUrl,
                                      selectedData?.appName ?? 'app');
                                } else {
                                  print(
                                      "Permissions not granted after settings");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Required permissions not granted. Please grant permissions in settings and try again."),
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
                            isInstalled?'Open':_isDownloading ? "Cancel" :'Install',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
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
              imageUrl: "${ApiUrl.base}$imagePath",
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
