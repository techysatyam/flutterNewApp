import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newwhhrrr/common/utils/constants/colors.dart';

import '../../utils/constants/image_strings.dart';
import '../button/custom_button.dart';


class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.heading,
    required this.subHeading,
    this.previousButtonText,
    this.previousOnTap,
    this.buttonText,
    this.onTap,
    this.buttonType = ButtonType.primary,
  });

  final String heading;
  final List<Widget> subHeading;
  final String? previousButtonText;
  final Function()? previousOnTap;
  final String? buttonText;
  final Function()? onTap;
  final ButtonType? buttonType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 500;
        bool isVerySmallScreen = constraints.maxWidth < 350;
        bool isSmallScreenForSubHeadings = constraints.maxWidth < 450;
        bool showInWrap = kIsWeb || (!kIsWeb && isVerySmallScreen);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSmallScreen) ...[
              // Using Wrap for small screen devices, stack buttons vertically
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.headingTextColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      if (isSmallScreenForSubHeadings)...[
                        if (subHeading.length > 2)
                          Wrap(
                            spacing: 8,
                            children: subHeading,
                          )
                        else
                          Row(children: subHeading),
                      ] else...[
                        Row(children: subHeading),
                      ]
                    ],
                  ),
                  if (previousButtonText != null && previousButtonText!.isNotEmpty)
                    CustomButton(
                      leftImage: AppImages.add,
                      fontWeight: FontWeight.w500,
                      leftImageWidth: 20,
                      leftImageHeight: 20,
                      borderRadius: 8,
                      text: previousButtonText!,
                      onTap: previousOnTap,
                      fontSize: 14,
                    ),
                  if (buttonType == ButtonType.back)
                    CustomButton(
                      elevation: 0,
                      leftImage: AppImages.backArrow,
                      fontWeight: FontWeight.w400,
                      leftImageWidth: 20,
                      leftImageHeight: 20,
                      textColor: AppColors.lightTextColor,
                      backgroundColor: AppColors.lightBgColor,
                      borderRadius: 8,
                      text: buttonText ?? "Back",
                      onTap: onTap,
                      fontSize: 14,
                    ),
                  if (buttonText != null && buttonText!.isNotEmpty && buttonType != ButtonType.back)
                    CustomButton(
                      leftImage: AppImages.add,
                      fontWeight: FontWeight.w500,
                      leftImageWidth: 20,
                      leftImageHeight: 20,
                      borderRadius: 8,
                      text: buttonText!,
                      onTap: onTap,
                      fontSize: 14,
                    ),
                ],
              ),
            ] else ...[
              // Original row layout for larger screens
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side (Heading + SubHeading)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.headingTextColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(children: subHeading),
                    ],
                  ),

                  // Right side buttons (Previous Button + Main Button)
                  Row(
                    children: [
                      if (previousButtonText != null && previousButtonText!.isNotEmpty)
                        CustomButton(
                          leftImage: AppImages.add,
                          fontWeight: FontWeight.w500,
                          leftImageWidth: 20,
                          leftImageHeight: 20,
                          borderRadius: 8,
                          text: previousButtonText!,
                          onTap: previousOnTap,
                          fontSize: 14,
                        ),
                      if ((previousButtonText != null && previousButtonText!.isNotEmpty) &&
                          (buttonText != null && buttonText!.isNotEmpty || buttonType == ButtonType.back))
                        SizedBox(width: 10),
                      if (buttonType == ButtonType.back)
                        CustomButton(
                          elevation: 0,
                          leftImage: AppImages.backArrow,
                          fontWeight: FontWeight.w400,
                          leftImageWidth: 20,
                          leftImageHeight: 20,
                          textColor: AppColors.lightTextColor,
                          backgroundColor: AppColors.lightBgColor,
                          borderRadius: 8,
                          text: buttonText ?? "Back",
                          onTap: onTap,
                          fontSize: 14,
                        )
                      else if (buttonText != null && buttonText!.isNotEmpty)
                        CustomButton(
                          leftImage: AppImages.add,
                          fontWeight: FontWeight.w500,
                          leftImageWidth: 20,
                          leftImageHeight: 20,
                          borderRadius: 8,
                          text: buttonText!,
                          onTap: onTap,
                          fontSize: 14,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

class SubHeading extends StatelessWidget {
  const SubHeading({super.key, required this.text, this.color, this.showIcon = true});
  final String text;
  final Color? color;
  final bool? showIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showIcon!)
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: color ?? AppColors.lightPrimaryColor,
          ),
        if (showIcon!) const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color ?? AppColors.lightPrimaryColor,
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

enum ButtonType {
  primary,
  back,
}
