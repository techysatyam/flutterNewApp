import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../utils/constants/colors.dart';
import '../data_table/custom_page_shifter.dart';

class NewCustomDataTable<T> extends StatelessWidget {
  final DynamicDataGridSource<T> dataSource;
  final List<GridColumn> columns;
  final bool isFooter;
  final bool isColumnExpand;
  final int? perPageRowData;
  final Function(DataGridRow)? onRowTap; // Callback for row tap
  // final Function(DataGridRow)? onEdit; // Callback for edit action
  // final Function(DataGridRow)? onDelete; // Callback for delete action
  final Function()? onBackPressed;
  final Function()? onForwardPressed;
  final Function()? startPage;
  final Function()? endPage;
  final Function(String)? onSearchPage;
  final TextEditingController? searchTextController;
  final bool canBack;
  final bool canForward;
  final int? page;
  final int? totalPage;
  final bool showCheckBox;
  final bool showCheckboxOnHeader;
  final SelectionMode selectionMode;
  final void Function(List<DataGridRow>, List<DataGridRow>)? onSelectionChanged;
  final DataGridController? controller;
  final double? headerHeight;

  const NewCustomDataTable({
    Key? key,
    required this.dataSource,
    required this.columns,
    this.isFooter = false,
    this.isColumnExpand = false,
    this.onRowTap,
    this.perPageRowData,
    this.onBackPressed,
    this.onForwardPressed,
    this.startPage,
    this.endPage,
    this.onSearchPage,
    this.searchTextController,
    this.canBack = false,
    this.canForward = false,
    this.showCheckBox = false,
    this.showCheckboxOnHeader = true,
    this.selectionMode = SelectionMode.none,
    this.page,
    this.totalPage,
    this.onSelectionChanged,
    this.controller,
    this.headerHeight,
    // this.onEdit,
    // this.onDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        headerColor: AppColors.tableHeaderBackgroundColor,
        gridLineColor: AppColors.tableBorderColor,
        selectionColor: const Color(0xffebf5ff),
        gridLineStrokeWidth: 1.0,
      ),
      child: SfDataGrid(
        controller: controller,
        onSelectionChanged: onSelectionChanged,
        checkboxColumnSettings: DataGridCheckboxColumnSettings(
            showCheckboxOnHeader: showCheckboxOnHeader),
        showCheckboxColumn: showCheckBox,
        selectionMode: selectionMode,
        rowsPerPage: perPageRowData ?? 100,
        headerRowHeight: headerHeight ?? 40.0,
        source: dataSource,
        columnWidthMode: isColumnExpand == true
            ? ColumnWidthMode.fill
            : ColumnWidthMode.lastColumnFill,
        columns: columns,
        isScrollbarAlwaysShown: true,
        verticalScrollPhysics: const AlwaysScrollableScrollPhysics(),
        footerHeight: 85,
        footer: isFooter
            ? Column(
                children: [
                  const SizedBox(height: 12),
                  if (dataSource.rows.isEmpty)
                    const SelectableText("No data Found",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5A5A5A))),
                  if (dataSource.rows.isEmpty) const SizedBox(height: 12),
                  CustomPageShifter(
                    onBackPressed: onBackPressed ?? () {},
                    onForwardPressed: onForwardPressed ?? () {},
                    startPage: startPage,
                    endPage: endPage,
                    onSearchPage: onSearchPage,
                    searchTextController: searchTextController,
                    canBack: canBack,
                    canForward: canForward,
                    page: page,
                    totalPage: totalPage,
                  ),
                ],
              )
            : Column(
                children: [
                  if (dataSource.rows.isEmpty) const SizedBox(height: 20),
                  if (dataSource.rows.isEmpty)
                    const SelectableText("No data Found",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5A5A5A))),
                ],
              ),
      ),
    );
  }
}

class DynamicDataGridSource<T> extends DataGridSource {
  DynamicDataGridSource({
    required List<T> data,
    required List<GridColumn> columns,
    required this.cellBuilder,
    this.onRowTap, // Add callback for row tap
    this.onEdit, // Add callback for edit action
    this.onDelete, // Add callback for delete action
    this.actions,
    this.selectedItems, // List to track selected items
    this.onCheckboxChanged, // Callback when checkbox changes
    this.onReturnPressed,
  }) {
    _columns = columns;
    /*     _data = data.map<DataGridRow>((e) {
        return DataGridRow(
            cells: _columns.map((column) {
          return DataGridCell<dynamic>(
            columnName: column.columnName,
            value: cellBuilder(
                e, column.columnName), // Returns either Widget or String
          );
        }).toList());
      }).toList();
    } */
    _data = data.map<DataGridRow>((e) {
      return DataGridRow(
        cells: _columns.map((column) {
          return DataGridCell<dynamic>(
            columnName: column.columnName,
            value: cellBuilder(e, column.columnName),
          );
        }).toList(),
      );
    }).toList();
  }

  List<DataGridRow> _data = [];
  List<GridColumn> _columns = [];

  // final String Function(T, String) cellBuilder;
  // final Widget Function(T, String) cellBuilder; // Change String to Widget here
  final dynamic Function(T, String)
      cellBuilder; // Allow returning either Widget or String
  final Function(DataGridRow)? onRowTap; // Callback for row tap
  final Function(DataGridRow)? onEdit; // Callback for edit action
  final Function(DataGridRow)? onDelete; // Callback for delete action
  final List<PopupAction>? actions;
  final Set<String>?
      selectedItems; // List of selected row IDs (or any unique identifier)
  final void Function(bool? newValue, int? rowId)?
      onCheckboxChanged; // Keep as int?
  final Function(DataGridRow)? onReturnPressed;

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        final String columnName = e.columnName;
        final dynamic value =
            e.value.toString() ?? ''; // May be Widget or String
        // final String textValue = value?.toString() ?? '';

        Widget cellContent;
         if (columnName == 'Action') {
          cellContent = PopupMenuButton<String>(
            color: Colors.white,
            position: PopupMenuPosition.under,
            onSelected: (selected) {
              final selectedAction = actions!.firstWhere(
                (action) => action.label == selected,
                orElse: () => actions!.first,
              );
              selectedAction.callback(row);
            },
            itemBuilder: (BuildContext context) => actions!
                .map((action) => PopupMenuItem<String>(
                      value: action.label,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            action.iconPath,
                            height: 18,
                            width: 18,
                            color: AppColors.actionIconColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            action.label,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0E0E0E),
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
            child: const Center(
              child: Icon(
                Icons.more_vert,
                color: Color(0xff5A5A5A),
              ),
            ),
          );
        } else if (columnName == 'Asset Action') {
          cellContent = Center(
            child: ElevatedButton(
              onPressed: () {
                onReturnPressed!(row);
              },
              child: Text(
                row
                        .getCells()
                        .firstWhere((cell) => cell.columnName == 'Asset Action')
                        .value ??
                    'Return',
              ),
            ),
          );
        } else if (columnName == 'Select') {
          cellContent = Checkbox(
            activeColor: Colors.blue,
            checkColor: Colors.white,
            value: selectedItems!.contains(value),
            onChanged: (bool? newValue) {
              print("selectedItems ===> $selectedItems");
              print("Checkbox clicked, new value: $newValue");
            },
          );
        } else if (columnName == 'Download') {
          cellContent = GestureDetector(
            onTap: () {
              if (value is Map<String, String>) {
                print('Download URL: ${value['url']}');
                // download('${value['url']}');
                // Implement download functionality
              }
            },
            child: const Center(
              child: Icon(
                Icons.download,
                color: Color(0xff5A5A5A),
              ),
            ),
          );
        } else if (columnName == 'Event Thumbnail' ||
            columnName == "Folder Thumbnail" ||
            columnName == "Driver Image" ||
            columnName == "Image") {
          cellContent = Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(value),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          // **Default Case:**
          // If value is a Widget, use it directly; otherwise, wrap it in SelectableText.
          if (value is Widget) {
            cellContent = value;
          } else {
            cellContent = Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                "$value",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tableRowTextColor,
                ),
              ),
            );
          }
        }

        return GestureDetector(
          onTap: () {
            if (onRowTap != null) {
              onRowTap!(row);
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: cellContent,
          ),
        );
      }).toList(),
    );
  }
}

class PopupAction {
  final String
      label; // The label for the action button (e.g., "Edit", "Delete")
  final String iconPath; // The path to the icon asset for the action button
  final Function(DataGridRow)
      callback; // The callback function to execute when the action is selected
  PopupAction({
    required this.label,
    required this.iconPath,
    required this.callback,
  });
}

GridColumn customDataGrid({required String title, Alignment? alignment}) =>
    GridColumn(
      columnName: title,
      label: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        alignment: alignment ?? Alignment.centerLeft,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.headingTextColor,
          ),
        ),
      ),
    );
