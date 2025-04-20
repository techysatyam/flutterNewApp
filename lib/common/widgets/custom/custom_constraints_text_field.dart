import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/colors.dart';
import '../text_field/custom_text_field.dart';


class CustomConstraintsTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final BoxConstraints? constraints;
  final bool? enabled, obscureText, readOnly;
  final int? maxLines, maxLength;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? textStyle, hintTextStyle, errorTextStyle, labelTextStyle;
  final BoxConstraints? suffixIconConstraints, prefixIconConstraints;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onChanged;
  final Function()? onTap;
  final FocusNode? focusNode;
  final bool isCollapsed, autoFocus, setMaxLineNull;
  final double? borderRadius, hintTextSize;
  final Color? borderColor, hintColor, fillColor, backgroundColor;
  final Iterable<String>? autofillHints;
  final double? maxWidth; // Optional maxWidth parameter

  const CustomConstraintsTextField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    required this.hintText,
    this.constraints,
    this.enabled,
    this.obscureText,
    this.readOnly,
    this.maxLines,
    this.maxLength,
    this.textInputType,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.labelTextStyle,
    this.hintTextSize,
    this.contentPadding,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.inputFormatter,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.isCollapsed = false,
    this.autoFocus = false,
    this.setMaxLineNull = false,
    this.borderRadius = 4,
    this.borderColor,
    this.hintColor,
    this.fillColor,
    this.autofillHints,
    this.maxWidth, // This is optional
    this.backgroundColor, // This is optional
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double effectiveMaxWidth = maxWidth ??
        (constraints!.maxWidth < 700
            ? constraints!.maxWidth * 0.9
            : constraints!.maxWidth * 0.42);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.headingTextColor,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: effectiveMaxWidth, // Make it more responsive
          ),
          child: Container(
            color: backgroundColor,
            child: CustomTextField.outlineBorder(
              controller: controller,
              validator: validator,
              hintText: hintText,
              hintTextStyle: hintTextStyle ?? TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightTextColor,
              ),
              borderRadius: borderRadius,
              borderColor: borderColor ?? AppColors.tableHeaderBackgroundColor,
              enabled: enabled,
              obscureText: obscureText,
              readOnly: readOnly,
              maxLines: maxLines,
              maxLength: maxLength,
              textInputType: textInputType,
              textInputAction: textInputAction,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              textStyle: textStyle,
              errorTextStyle: errorTextStyle,
              labelTextStyle: labelTextStyle,
              hintTextSize: hintTextSize,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12), // Increased padding
              suffixIconConstraints: suffixIconConstraints,
              prefixIconConstraints: prefixIconConstraints,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              inputFormatter: inputFormatter,
              onChanged: onChanged,
              onTap: onTap,
              // focusNode: focusNode,
              isCollapsed: isCollapsed,
              autoFocus: autoFocus,
              setMaxLineNull: setMaxLineNull,
              hintColor: hintColor,
              // fillColor: fillColor,
              autofillHints: autofillHints,
            ),
          ),
        ),
      ],
    );
  }
}
