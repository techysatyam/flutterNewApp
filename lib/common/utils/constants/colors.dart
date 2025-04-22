import 'package:flutter/material.dart';

import '../helpers/helper_functions.dart';

//===================>> IMPORTANT NOTE <<================================
// Use methods colors on ui not light or dark key to support both like and dark themes
// for example AppColors.primaryColor(BuildContext context) like this for every colors
//===================>> IMPORTANT NOTE <<================================

class AppColors {
  //===========>>> App Theme Light Colors <<<=====================
  static const Color lightPrimaryColor = Color(0xFFFEBD38)/*Color(0xFF9C88FB)*/;
  static const Color bgMainColor = Color(0xFFFFD572)/*Color(0xFFE6E6FA)*/;
  static const Color lightSecondaryColor = Color(0xFFFEBD38);
  static const Color lightTextColor = Color(0xFF1E265E);
  static const Color lightParagraphColor = Color(0xFF9FA2B8);
  static const Color lightBgColor = Color(0xFFFFFFFF);
  static const Color lightIconColor = Color(0xFF1E265E);
  static const Color lightDefaultColor = Color(0xFF1E265E);
  static const Color lightDividerColor = Color(0xFFF3F3F3);
  static const Color tableHeaderBackgroundColor = Color(0xffFAFAFA);
  static const Color tableBorderColor = Color(0xffE0E0E0);
  static Color actionIconColor = const Color(0xFFB3B3B3);
  static const Color tableRowTextColor = Color(0xff5A5A5A);
  static Color headingTextColor = const Color(0xFF0A0908);
  static Color sideBarTextColor = const Color(0xFF6C6B6B);
  static const Color greyColor = Color(0xFF787B80);
  static Color hintTextColor = const Color(0xFF9EA2AE);
  static Color dividerColor2 = const Color(0xFFF7F5FF);
  static Color textFieldOutLineColor = const Color(0xFFE4E5E7);

  // primary gradient light
  static const Color lightPrimaryGradient1 = Color(0xFFB09FFF);
  static const Color lightPrimaryGradient2 = Color(0xFF8D79F6);

  // secondary gradient light
  static const Color lightSecondaryGradient1 = Color(0xFFFFD572);
  static const Color lightSecondaryGradient2 = Color(0xFFFEBD38);

  // green gradient light
  static const Color lightGreenGradient1 = Color(0xFFABE741);
  static const Color lightGreenGradient2 = Color(0xFF95C939);

  // green gradient light
  static const Color lightRedGradient1 = Color(0xFFF32A36);
  static const Color lightRedGradient2 = Color(0xFFE30513);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //===========>>> App Theme Dark Colors <<<=====================
  static const Color darkPrimaryColor = Color(0xFF9C88FB);
  static const Color darkSecondaryColor = Color(0xFFFEBD38);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkParagraphColor = Color(0xFF9FA2B8);
  static const Color darkBgColor = Color(0xFF0A0A1C);
  static const Color darkIconColor = Color(0xFFFFFFFF);
  static const Color darkDefaultColor = Color(0xFFFFFFFF);

  // static const Color darkDividerColor = Color(0xFF02021E);
  static const Color darkDividerColor = Color(0xFF1A1A37);

  // primary gradient dark
  static const Color darkPrimaryGradient1 = Color(0xFFB09FFF);
  static const Color darkPrimaryGradient2 = Color(0xFF8D79F6);

  // secondary gradient dark
  static const Color darkSecondaryGradient1 = Color(0xFFFFD572);
  static const Color darkSecondaryGradient2 = Color(0xFFFEBD38);

  static Color primaryColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkPrimaryColor : lightPrimaryColor;
  }

  static Color secondaryColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkSecondaryColor : lightSecondaryColor;
  }

  static Color textColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkTextColor : lightTextColor;
  }

  static Color paragraphColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkParagraphColor : lightParagraphColor;
  }

  static Color bgColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkBgColor : lightBgColor;
  }

  static Color iconColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkIconColor : lightIconColor;
  }

  static Color defaultColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkDefaultColor : lightDefaultColor;
  }

  static Color dividerColor(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkDividerColor : lightDividerColor;
  }

  static Color primaryGradient1(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkPrimaryGradient1 : lightPrimaryGradient1;
  }

  static Color primaryGradient2(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkPrimaryGradient2 : lightPrimaryGradient2;
  }

  static Color secondaryGradient1(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkSecondaryGradient1 : lightSecondaryGradient1;
  }

  static Color secondaryGradient2(BuildContext context) {
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    return isDarkMode ? darkSecondaryGradient2 : lightSecondaryGradient2;
  }
}
