import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    iconTheme:
        IconThemeData(color: AppColors.lightIconColor, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.lightIconColor, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextColor),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.darkBgColor,
    surfaceTintColor: AppColors.darkBgColor,
    iconTheme: IconThemeData(color: AppColors.darkIconColor, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.darkIconColor, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextColor),
  );
}
