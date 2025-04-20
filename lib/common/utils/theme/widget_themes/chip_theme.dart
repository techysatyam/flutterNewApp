import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: AppColors.lightSecondaryColor,
    selectedColor: AppColors.lightPrimaryColor,
    disabledColor: AppColors.lightDefaultColor.withAlpha(40),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: const TextStyle(color: AppColors.lightDefaultColor, fontFamily: 'Urbanist'),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: AppColors.darkSecondaryColor,
    selectedColor: AppColors.darkPrimaryColor,
    disabledColor: AppColors.darkDefaultColor,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: AppColors.darkDefaultColor, fontFamily: 'Urbanist'),
  );
}
