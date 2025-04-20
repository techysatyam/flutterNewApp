import '../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../constants/colors.dart';
import '../constants/enums.dart';

class CustomSnackBar {
  static showDefaultWebToast(
      {required BuildContext context,
      required String message,
      ToastificationType? type}) {
    toastification.show(
      context: context,
      // type: type,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(message),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: type == ToastificationType.error
          ? const Icon(Icons.cancel_outlined)
          : const Icon(Icons.check),
      showIcon: true,
      // show or hide the icon
      primaryColor:
          type == ToastificationType.error ? Colors.red : Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) =>
            print('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) =>
            print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static showWebToast(
      {required BuildContext context,
      required String message,
      ToastType toastType = ToastType.success}) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topRight,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.bgColor(context),
              border: Border.all(
                  width: 1, color: getToastColor(toastType).withAlpha(70))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(getToastIcon(toastType),
                  size: AppSizes.iconMd - 4, color: getToastColor(toastType)),
              const SizedBox(
                width: AppSizes.md,
              ),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: AppSizes.fontSizeSm,
                        color: getToastColor(toastType),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Color getToastColor(ToastType toastType) {
  switch (toastType) {
    case ToastType.error:
      return Colors.red;
    case ToastType.success:
      return Colors.green;
    case ToastType.warning:
      return Colors.orange;
    case ToastType.info:
      return Colors.blue;
  }
}

IconData getToastIcon(ToastType toastType) {
  switch (toastType) {
    case ToastType.error:
      return Icons.error_outline;
    case ToastType.success:
      return Icons.check;
    case ToastType.warning:
      return Icons.error_outline;
    case ToastType.info:
      return Icons.error_outline;
  }
}
