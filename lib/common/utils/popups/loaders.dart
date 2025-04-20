import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../helpers/helper_functions.dart';

class TLoaders {
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static defaultSnackBar({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.lightDividerColor.withAlpha(90)
                : AppColors.lightDividerColor.withAlpha(90),
          ),
          child: Center(
              child:
                  Text(message, style: Theme.of(context).textTheme.bodyMedium)),
        ),
      ),
    );
  }

  static successSnackBar({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.success.withAlpha(90)
                : AppColors.success.withAlpha(90),
          ),
          child: Center(
              child:
                  Text(message, style: Theme.of(context).textTheme.bodyMedium)),
        ),
      ),
    );
  }

  static warningSnackBar({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.warning.withAlpha(90)
                : AppColors.warning.withAlpha(90),
          ),
          child: Center(
              child:
                  Text(message, style: Theme.of(context).textTheme.bodyMedium)),
        ),
      ),
    );
  }

  static errorSnackBar({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.error.withAlpha(90)
                : AppColors.error.withAlpha(90),
          ),
          child: Center(
              child:
                  Text(message, style: Theme.of(context).textTheme.bodyMedium)),
        ),
      ),
    );
  }

  static showDefaultToast(
      {required String message,
      required BuildContext context,
      Color? color,
      Color? textColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: color ?? AppColors.primaryColor(context),
        textColor: textColor ?? AppColors.paragraphColor(context),
        fontSize: 14.0);
  }

  static showSuccessToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static showErrorToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
