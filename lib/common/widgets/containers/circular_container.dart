import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.showBorder = false,
    this.backgroundColor = AppColors.lightDefaultColor,
    this.borderColor = AppColors.lightDividerColor,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
