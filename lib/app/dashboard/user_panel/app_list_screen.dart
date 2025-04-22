import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_projects/common/widgets/custom/custom_search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/validators/validation.dart';
import '../../../common/widgets/custom/custom_row_table.dart';
import '../../../common/widgets/loaders/circular_loader.dart';
import 'custom_app_list_tile.dart';

class AppListScreen extends StatefulWidget {
  static const String route = '/app_list';
  const AppListScreen({super.key});

  @override
  State<AppListScreen> createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final formKey = GlobalKey<FormState>();
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(DashboardEvent.getForm());
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    context.read<DashboardBloc>().add(DashboardEvent.getForm());
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    DashboardBloc bloc = context.read<DashboardBloc>();

    return Scaffold(
      body: Container(
        color: AppColors.lightBgColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: BlocConsumer<DashboardBloc, DashboardState>(
              listener: (context, state) {},
              builder: (context, state) {
                final isLoading = state.status == DashBoardStatus.loading ||
                    state.status == DashBoardStatus.updating;

                if (isLoading) {
                  return const Center(child: CustomCircularLoader());
                }

                if (state.status == DashBoardStatus.error) {
                  return Center(
                    child: Text(state.message ?? "Something went wrong"),
                  );
                }

                // final originalApps = state.getAllAppModel?.data ?? [];
                // final apps = List.generate(10, (_) => originalApps).expand((e) => e).toList();
                final apps = state.getAllAppModel?.data ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: const Text(
                            'App List',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomSearchBar(
                            searchController: bloc.appSearchController,
                            onClearSearchText: () {
                              if (bloc.appSearchController.text.isNotEmpty) {
                                bloc.appSearchController.clear();
                                bloc.add(DashboardEvent.getForm(pageNumber: 1));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    apps.isEmpty ? Center(child: Text('No apps available.')) :
                    Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        header: WaterDropHeader(waterDropColor: Colors.transparent,
                          idleIcon: Image.asset(
                          AppImages.customLoader,
                          fit: BoxFit.contain,
                        ),refresh:  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                                AppImages.customLoader,height:40,
                                fit: BoxFit.contain,

                          ),
                        ),),
                        onRefresh: _onRefresh,
                        controller: _refreshController,
                        child: ListView.separated(
                          itemCount: apps.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final app = apps[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: AppListTile(app: app),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


