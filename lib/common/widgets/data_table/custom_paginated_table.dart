import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomDataTable extends StatelessWidget {
  final List<String> columns;
  final List<Map<String, dynamic>> data;
  final List<PopupMenuItem<String>> Function(int index)? popupActions;
  final Function(String action, int index)? onPopupActionSelected;

  const CustomDataTable({
    super.key,
    required this.columns,
    required this.data,
    this.popupActions,
    this.onPopupActionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // Device Type Check
        bool isMobile =
            screenWidth <= AppSizes.mobileScreenSize; // Mobile Screen
        bool isTablet = screenWidth > AppSizes.mobileScreenSize &&
            screenWidth <= AppSizes.tabletScreenSize; // Tablet

        final columnSpacing = isMobile
            ? screenWidth * 0.001
            : isTablet
                ? screenWidth * 0.03
                : screenWidth * 0.18;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor(context),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.borderRadiusXl),
                topRight: Radius.circular(AppSizes.borderRadiusXl),
                bottomRight: Radius.circular(AppSizes.borderRadiusXl),
                bottomLeft: Radius.circular(AppSizes.borderRadiusXl)),
            border: Border(
                top: BorderSide(
                    color: AppColors.dividerColor(context), width: 1),
                right: BorderSide(
                    color: AppColors.dividerColor(context), width: 1),
                left: BorderSide(
                    color: AppColors.dividerColor(context), width: 1)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDataTable(columnSpacing, context),
                  // _paginationRow(context, screenWidth)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DataTable buildDataTable(double columnSpacing, BuildContext context) {
    return DataTable(
      columnSpacing: columnSpacing,
      headingRowHeight: 60,
      border: TableBorder(
        horizontalInside:
            BorderSide(color: AppColors.dividerColor(context), width: 1),
      ),
      columns:
          columns.map((column) => buildDataColumn(column, context)).toList(),
      /* rows: data.map((row) {
        return buildDataRow(row);
      }).toList(),*/
      rows: data.asMap().entries.map((entry) {
        int index = entry.key; // Get the index
        Map<String, dynamic> row = entry.value; // Get the row data

        return buildDataRow(row, index, context);
      }).toList(),
    );
  }

  DataRow buildDataRow(
      Map<String, dynamic> row, int index, BuildContext context) {
    return DataRow(
      cells: columns.map((column) {
        var value = row[column] ?? '';
        return DataCell(
          column == 'Status'
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.defaultSpace),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: value == 'Success'
                          ? LinearGradient(colors: [
                              AppColors.primaryColor(context),
                              AppColors.primaryColor(context),
                            ])
                          : LinearGradient(colors: [
                              AppColors.primaryColor(context).withOpacity(0.8),
                              AppColors.primaryColor(context)
                            ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        value == 'Success'
                            ? BoxShadow(
                                color: AppColors.primaryColor(context)
                                    .withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: const Offset(0, 10),
                              )
                            : BoxShadow(
                                color: AppColors.primaryColor(context)
                                    .withOpacity(0.5)
                                    .withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: const Offset(0, 10),
                              )
                      ],
                    ),
                    child: Text('$value',
                        style: TextStyle(color: AppColors.bgColor(context))),
                  ),
                )
              : column == 'Action'
                  ? PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.textColor(context),
                      ),
                      onSelected: (value) {
                        if (onPopupActionSelected != null) {
                          onPopupActionSelected!(value, index);
                        }
                      },
                      itemBuilder: (context) =>
                          popupActions != null ? popupActions!(index) : [],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultSpace),
                      child: Text('$value'),
                    ),
        );
      }).toList(),
    );
  }

  DataColumn buildDataColumn(String column, BuildContext context) {
    return DataColumn(
        label: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
      ),
      child: Text(column,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500)),
    ));
  }
}
