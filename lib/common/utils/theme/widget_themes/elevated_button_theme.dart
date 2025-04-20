import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.lightPrimaryColor,
      backgroundColor: AppColors.lightPrimaryColor,
      disabledForegroundColor: AppColors.lightPrimaryColor,
      disabledBackgroundColor: AppColors.lightPrimaryColor,
      side: const BorderSide(color: AppColors.lightPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.lightParagraphColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Urbanist'),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.darkPrimaryColor,
      backgroundColor: AppColors.darkPrimaryColor,
      disabledForegroundColor: AppColors.darkPrimaryColor,
      disabledBackgroundColor: AppColors.darkPrimaryColor,
      side: const BorderSide(color: AppColors.darkPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.darkParagraphColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'Urbanist'),
    ),
  );
}
