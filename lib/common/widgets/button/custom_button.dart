import 'package:flutter_svg/svg.dart';

import '../../utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../loaders/circular_loader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLoading = false,
    this.backgroundColor,
    this.borderColor,
    this.fontWeight = FontWeight.w600,
    this.textColor,
    this.width,
    this.height,
    this.image,
    this.imageHeight,
    this.imageWidth,
    this.leftImage,
    this.leftImageHeight,
    this.leftImageWidth,
    required this.borderRadius,
    required this.text,
    required this.onTap,
    required this.fontSize,
    this.elevation,
  });

  final double fontSize;
  final FontWeight fontWeight;
  final Color? backgroundColor, borderColor;
  final double borderRadius;
  final String? image;
  final String? leftImage;
  final Color? textColor;
  final String text;
  final double? imageHeight, imageWidth;
  final double? leftImageHeight, leftImageWidth;
  final double? width, height;
  final Function()? onTap;
  final bool isLoading;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 42, // 👈 Define consistent height here
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          backgroundColor: backgroundColor ?? AppColors.lightPrimaryColor,
          shape: RoundedRectangleBorder(
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(color: borderColor!),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero, // 👈 Avoid default button size
        ),
        child: isLoading
            ? CustomCircularLoader(
          backgroundColor: Theme.of(context).colorScheme.surface,
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftImage != null) ...[
              SvgPicture.asset(
                leftImage!,
                width: leftImageWidth ?? 14,
                height: leftImageHeight ?? 14,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              text,
              style: TextStyle(
                color: onTap == null
                    ? Theme.of(context).colorScheme.secondary
                    : textColor ?? AppColors.lightBgColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
            if (image != null) ...[
              const SizedBox(width: 6),
              SvgPicture.asset(
                image!,
                width: imageWidth ?? 18,
                height: imageHeight ?? 18,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
