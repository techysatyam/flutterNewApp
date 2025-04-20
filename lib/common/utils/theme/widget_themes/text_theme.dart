import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppTextTheme {
  AppTextTheme._(); // Prevent instantiation

  // Light Theme Text Styles
  static const TextTheme lightTextTheme = TextTheme(
    headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextColor),
    titleMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextColor),
    bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextColor),
    labelMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextColor),
  );

  // Dark Theme Text Styles
  static const TextTheme darkTextTheme = TextTheme(
    headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextColor),
    titleMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextColor),
    bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextColor),
    labelMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.darkTextColor),
  );
}
