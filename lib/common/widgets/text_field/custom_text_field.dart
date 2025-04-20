import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField.outlineBorder({
    super.key,
    this.borderRadius,
    this.textStyle,
    this.controller,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.hintTextStyle,
    this.contentPadding,
    this.enabled,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.inputFormatter,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.autoFocus = false,
    this.autofillHints,
    this.onTap,
    this.readOnly,
  })  : _isOutlinedBorder = true;

  const CustomTextField.underlineBorder({
    super.key,
    this.borderRadius,
    this.textStyle,
    this.controller,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.inputFormatter,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.autoFocus = false, this.hintTextStyle,
    this.autofillHints,
    this.onTap,
    this.readOnly,
  })  : _isOutlinedBorder = false;

  final bool _isOutlinedBorder;
  final bool isCollapsed;
  final bool setMaxLineNull;
  // ===============================
  final double? hintTextSize;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final Widget? suffixIcon, prefixIcon;
  final EdgeInsets? contentPadding;
  final String? labelText;
  final TextStyle? labelTextStyle, textStyle, errorTextStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? enabled;
  final int? maxLines, maxLength;
  final TextEditingController? controller;
  final Color? borderColor, hintColor;
  final BoxConstraints? suffixIconConstraints, prefixIconConstraints;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool autoFocus;
  final bool? readOnly;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    InputBorder border = _isOutlinedBorder
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.onSurface,
      ),
    )
        : UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.onSurface,
      ),
    );

    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      autofillHints: autofillHints,
      autofocus: autoFocus,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      initialValue: initialValue,
      validator: validator,
      obscureText: obscureText ?? false,
      enabled: enabled,
      maxLength: maxLength,
      maxLines: setMaxLineNull ? null : maxLines ?? 1,
      style:
      textStyle ?? TextStyle(color: Theme.of(context).colorScheme.shadow),
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        isCollapsed: isCollapsed,
        counterText: '',
        labelText: labelText,
        labelStyle: labelTextStyle ?? TextStyle(color: Theme.of(context).colorScheme.shadow),
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyle(
          fontSize: hintTextSize,
          color: hintColor ?? Theme.of(context).colorScheme.outline,
        ),
        errorStyle: errorTextStyle,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        contentPadding: contentPadding,
      ),

    );
  }
}

class InvisibleTextField extends StatefulWidget {
  const InvisibleTextField({
    super.key,
    required this.borderRadius,
    this.textStyle,
    this.controller,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.inputFormatter,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.hintTextAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.fillColor,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.hintFontWeight,
    this.readOnly = false,
  })  : _isOutlinedBorder = true;

  final bool _isOutlinedBorder;
  final bool isCollapsed;
  final bool setMaxLineNull;
  // ===============================
  final double? hintTextSize;
  final String? hintText;
  final double borderRadius;
  final Widget? suffixIcon, prefixIcon;
  final EdgeInsets? contentPadding;
  final String? labelText;
  final TextStyle? labelTextStyle, textStyle, errorTextStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? enabled;
  final int? maxLines, maxLength;
  final TextEditingController? controller;
  final Color? borderColor, hintColor, fillColor;
  final BoxConstraints? suffixIconConstraints, prefixIconConstraints;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextAlign textAlign;
  final TextAlign? hintTextAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onChanged, onSubmit;
  final Function()? onTap;
  final FocusNode? focusNode;
  final FontWeight? hintFontWeight;
  final bool readOnly;

  @override
  State<InvisibleTextField> createState() => _InvisibleTextFieldState();
}

class _InvisibleTextFieldState extends State<InvisibleTextField> {
  @override
  Widget build(BuildContext context) {
    InputBorder border = widget._isOutlinedBorder
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: widget.borderColor ?? Colors.transparent,
      ),
    )
        : UnderlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: widget.borderColor ?? Colors.transparent,
      ),
    );

    return IntrinsicWidth(
      child: TextFormField(

        focusNode: widget.focusNode,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onSubmit,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        initialValue: widget.initialValue,
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        maxLines: widget.setMaxLineNull ? null : widget.maxLines ?? 1,
        style: widget.textStyle ??
            TextStyle(color: Theme.of(context).colorScheme.shadow),
        inputFormatters: widget.inputFormatter,
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,
          isCollapsed: widget.isCollapsed,
          counterText: '',
          labelText: widget.labelText,
          labelStyle: widget.labelTextStyle ?? TextStyle(color: Theme.of(context).colorScheme.shadow),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: widget.hintTextSize,
            color: widget.hintColor ?? Theme.of(context).colorScheme.outline,
            fontWeight: widget.hintFontWeight ?? FontWeight.normal,
          ),
          errorStyle: widget.errorTextStyle,
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: widget.suffixIconConstraints,
          prefixIconConstraints: widget.prefixIconConstraints,
          contentPadding: widget.contentPadding,
        ),

      ),
    );
  }
}
