import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomInkwell extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;

  const CustomInkwell(
      {super.key,
      this.borderRadius = AppSizes.borderRadiusMd, // Default border radius
      required this.child,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent, // Required for ripple effect
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          highlightColor: AppColors.primaryColor(context).withOpacity(0.1),
          splashColor: Colors.white10,
          child: child,
        ),
      ),
    );
  }
}
