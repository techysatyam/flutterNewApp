import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newwhhrrr/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:newwhhrrr/app/dashboard/models/get_all_app_model.dart';
import 'package:newwhhrrr/common/networking/api_url.dart';
import 'package:newwhhrrr/common/utils/formatters/formatter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../common/utils/constants/colors.dart';
import '../../common/utils/constants/image_strings.dart';
import '../../common/widgets/custom/custom_header.dart';
import '../../common/widgets/custom/custom_row_table.dart';
import '../../common/widgets/loaders/circular_loader.dart';
import '../../common/widgets/new_custom_data_table/new_custom_data_table.dart';
import 'package:url_launcher/url_launcher.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const route = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<GridColumn> column = [
    customDataGrid(title: 'S.No'),
    customDataGrid(title: 'App Name'),
    customDataGrid(title: 'Status'),
    customDataGrid(title: 'Upload Date'),
    customDataGrid(title: 'Action', alignment: Alignment.center),
  ];

  @override
  void initState() {
    context.read<DashboardBloc>().add(const DashboardEvent.getForm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> downloadAndInstallApk(String apkUrl, String? apkFile) async {
      try {
        // Get the directory to store the downloaded file
        final dir = await getExternalStorageDirectory();
        final fileName = apkFile?.split('/').last ?? 'app.apk';
        final filePath = "${dir!.path}/$fileName";

        final dio = Dio();

        // Download the APK file
        await dio.download(
          apkUrl,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              int progress = (received / total * 100).floor();
              print("Downloading: $progress%");
            }
          },
        );

        // Show completion message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Download complete. Installing...")),
        );

        // Step 3: Open the downloaded file and trigger installation
        final result = await OpenFile.open(filePath);

        // Handle errors when opening the file
        if (result.type != ResultType.done) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error opening the file: ${result.message}")),
          );
        }
      } catch (e) {
        print("Error during download or installation: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
    DashboardBloc bloc = context.read<DashboardBloc>();
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {
           /* if (state.status == DashBoardStatus.toastError) {
              CustomSnackBar.showWebToast(context: context, message: state.message);
            }*/
          },
          builder: (context, state) {
            return /*state.status == DashBoardStatus.loading
                ? const CustomCircularLoader()
                :*/ SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomHeader(
                    heading: 'Form',
                    subHeading: [
                      SubHeading(
                        text: "Dashboard",
                        showIcon: false,
                      ),
                      SubHeading(
                        text: "Form",
                        color: AppColors.lightTextColor,
                      ),
                    ],
                    buttonText: 'Add Form',
                    onTap: () {
                      context.go("/dashboard/add_form");
                      // context.read<DashboardBloc>().add(DashboardEvent.getForm(pageNumber: 1));
                      },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomRowTable(
                    title: "Form",
                    searchController: bloc.appSearchController,
                    onClearSearchText: () {
                      if (bloc.appSearchController.text.isNotEmpty) {
                        bloc.appSearchController.text = '';
                        bloc.add(DashboardEvent.getForm(pageNumber: 1));
                      }
                    },
                  ),
                  state.status == DashBoardStatus.updating
                      ? const CustomCircularLoader()
                      : NewCustomDataTable<GetForm>(
                          isColumnExpand: true,
                          // isFooter: true,
                          dataSource: DynamicDataGridSource<GetForm>(
                            data: state.getAllAppModel?.data ?? [],
                            columns: column,
                            cellBuilder: (viewExpense, expenseName) {
                              final index = state.getAllAppModel?.data
                                      ?.indexOf(viewExpense) ??
                                  0;
                              switch (expenseName) {
                                case 'S.No':
                                  return "${(state.pageNumber - 1) * 10 + index + 1}";
                                case 'App Name':
                                  return state
                                      .getAllAppModel?.data?[index].appName
                                      .toString();
                                case 'Status':
                                  return state.getAllAppModel?.data?[index]
                                          .appName ??
                                      "-";
                                case 'Upload Date':
                                  return AppFormatter.formatDate((state
                                          .getAllAppModel
                                          ?.data?[index]
                                          .createdAt ??
                                      '-') as DateTime?);
                                case 'Action':
                                  return "Action";
                                default:
                                  return 'N/A';
                              }
                            },
                            actions: [
                              PopupAction(
                                  label: 'View',
                                  iconPath: AppImages.viewIcon,
                                  callback: (row) {
                                    final rowId = row.getCells()[0].value;
                                    final index =
                                        (int.tryParse(rowId) ?? 0) - 1;
                                    final minusIndex = index != -1;
                                    if (minusIndex) {
                                      final selectedData = state
                                          .getAllAppModel!.data![index % 10];
                                      context.go("/dashboard/view_form",
                                          extra: selectedData);
                                    }
                                  }),
                    PopupAction(
                      label: 'Download',
                      iconPath: AppImages.uploadIcon,
                      callback: (row) async {
                        final rowId = (row.getCells()[0].value);
                        final index = int.parse(rowId) - 1;
                        final selectedData = state.getAllAppModel!.data![index % 10];
                        final apkUrl = "${ApiUrl.download}${selectedData.apkFile ?? ''}";
                        print('APK URL ---> ${apkUrl}');

                        // Step 1: Check and request storage permission
                        final status = await Permission.storage.request();

                        if (status.isGranted) {
                          // Proceed with downloading the APK file
                          await downloadAndInstallApk(apkUrl, selectedData.apkFile);
                        } else {
                          // Show a message to the user if permission is denied
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Storage permission is required.")),
                          );
                        }
                      },
                    )


                            ],
                          ),
                          columns: column,
                          // onBackPressed: () {
                          //   var bloc = context.read<DashboardBloc>();
                          //   if (bloc.state.pageNumber > 1) {
                          //     bloc.add(DashboardEvent.getForm(
                          //         pageNumber: bloc.state.pageNumber - 1));
                          //   }
                          // },
                          // onForwardPressed: () {
                          //   // var bloc = context.read<DashboardBloc>();
                          //   // if (state.pageNumber <
                          //   //     (state.getAllAppModel?.totalRows ?? 1)) {
                          //   //   bloc.add(DashboardEvent.getForm(
                          //   //       pageNumber: bloc.state.pageNumber + 1));
                          //   // }
                          // },
                          // onSearchPage: (value) {
                          //   var bloc = context.read<DashboardBloc>();
                          //   bloc.add(DashboardEvent.getForm(
                          //       pageNumber: int.tryParse(value) ?? 1));
                          // },
                          // totalPage: (state.getAllAppModel?.totalRows ?? 0) > 0
                          //     ? ((state.getAllAppModel!.totalRows! - 1) ~/ 10) + 1 : 1,
                          // page: state.pageNumber,
                          // canBack: state.pageNumber > 1,
                          // canForward: state.pageNumber <
                          //     ((state.getAllAppModel?.totalRows ?? 0) > 0
                          //         ? ((state.getAllAppModel!.totalRows! - 1) ~/
                          //         10) + 1
                          //         : 1),
                        ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
