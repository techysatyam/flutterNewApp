import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';


class CustomAnimatedDropdown<T> extends StatelessWidget {
  const CustomAnimatedDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.validator,
    this.controller,
    this.hintText,
    this.initialItem,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
  });
  final List<dynamic>? items;
  final dynamic Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final SingleSelectController<dynamic>? controller;
  final String? hintText;
  final dynamic initialItem;
  final double? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CustomDropdown.search(
      itemsListPadding: const EdgeInsets.only(bottom: 20),
      // listItemPadding: EdgeInsets.only(bottom: 20),
      initialItem: initialItem,
      closedHeaderPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      hideSelectedFieldWhenExpanded: true,
      excludeSelected: false,
      validator: validator,
      controller: controller,
      items: items,
      onChanged: onChanged,
      hintText: hintText,
      decoration: CustomDropdownDecoration(
          closedSuffixIcon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.hintTextColor,
          ),
          closedBorderRadius:
          BorderRadius.all(Radius.circular(borderRadius ?? 4)),
          closedBorder: Border(
            bottom: BorderSide(
                color: borderColor ?? AppColors.dividerColor2,
                strokeAlign: -1.0),
            top: BorderSide(
                color: borderColor ?? AppColors.dividerColor2,
                strokeAlign: -1.0),
            left: BorderSide(
              color: borderColor ?? AppColors.dividerColor2,
            ),
            right: BorderSide(color: borderColor ?? AppColors.dividerColor2),
          ),
          headerStyle: const TextStyle(color: Colors.black),
          listItemStyle: const TextStyle(color: Colors.black)),
    );
  }
}

class CustomAnimatedSearchDropdown extends StatelessWidget {
  const CustomAnimatedSearchDropdown(
      {super.key,
        required this.items,
        required this.onChanged,
        this.validator,
        this.controller,
        this.initialItem});
  final List<dynamic>? items;
  final dynamic initialItem;
  final dynamic Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final SingleSelectController<dynamic>? controller;
  @override
  Widget build(BuildContext context) {
    return CustomDropdown.search(
      initialItem: initialItem,
      hideSelectedFieldWhenExpanded: true,
      excludeSelected: false,
      validator: validator,
      controller: controller,
      items: items,
      onChanged: onChanged,
      decoration: CustomDropdownDecoration(
          closedSuffixIcon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.hintTextColor,
          ),
          closedBorder: Border(
            bottom: BorderSide(color: AppColors.dividerColor2),
            top: BorderSide(color: AppColors.dividerColor2),
            left: BorderSide(color: AppColors.dividerColor2),
            right: BorderSide(color: AppColors.dividerColor2),
          ),
          headerStyle: const TextStyle(color: Colors.black),
          listItemStyle: const TextStyle(color: Colors.black)),
    );
  }
}

class CustomMultiSelectDropdown<T> extends StatelessWidget {
  const CustomMultiSelectDropdown(
      {super.key,
        required this.items,
        required this.initialItems,
        required this.onListChanged,
        this.validator,
        this.controller,
        this.borderColor,
        this.borderRadius,
      });

  final List<T>? items;
  final List<T>? initialItems;
  final dynamic Function(List<T>)? onListChanged;
  final String? Function(dynamic)? validator;
  final SingleSelectController<T>? controller;
  final double? borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<T>.multiSelect(
      hideSelectedFieldWhenExpanded: true,
      listValidator: validator,
      controller: controller,
      items: items,
      itemsListPadding: const EdgeInsets.only(bottom: 20),
      initialItems: initialItems,
      closedHeaderPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: CustomDropdownDecoration(
        closedSuffixIcon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.hintTextColor,
        ),
        closedBorderRadius:
        BorderRadius.all(Radius.circular(borderRadius ?? 4)),
        closedBorder: Border(
          bottom: BorderSide(
              color: borderColor ?? AppColors.dividerColor2,
              strokeAlign: -1.0),
          top: BorderSide(
              color: borderColor ?? AppColors.dividerColor2,
              strokeAlign: -1.0),
          left: BorderSide(
            color: borderColor ?? AppColors.dividerColor2,
          ),
          right: BorderSide(color: borderColor ?? AppColors.dividerColor2),
        ),
        listItemDecoration: ListItemDecoration(
          selectedIconColor: AppColors.lightPrimaryColor,  // Ensures the icon is in primary color
        ),
        headerStyle: const TextStyle(color: Colors.black),
        listItemStyle: const TextStyle(color: Colors.black),
      ),
      onListChanged: onListChanged,
    );
  }
}