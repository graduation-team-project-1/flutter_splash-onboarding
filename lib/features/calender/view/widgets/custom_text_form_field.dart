import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWithBackground extends StatelessWidget {
  const CustomTextFormFieldWithBackground({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "$hintText is required";
        } else {
          return null;
        }
      },
      cursorColor: ColorManager.mainColor,
      maxLines: maxLines,
      style: Styles.textStyle14.copyWith(
          color: ColorManager.barColor,
          fontFamily: FontType.kRoboto,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: Styles.textStyle14.copyWith(
            color: ColorManager.barColor, fontFamily: FontType.kRoboto),
        border: buidBorder(),
        enabledBorder: buidBorder(),
        fillColor: ColorManager.textFormFieldColor,
        filled: true,
        focusedBorder: buidBorder(borderColor: ColorManager.textFormFieldColor),
      ),
    );
  }

  OutlineInputBorder buidBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide:
          BorderSide(color: borderColor ?? ColorManager.textFormFieldColor),
    );
  }
}

class CustomTextFormFieldWithoutBackground extends StatelessWidget {
  const CustomTextFormFieldWithoutBackground({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.labelText,
    this.onChanged,
    this.borderRadius,
    this.trailingIcon,
    this.borderWidth,
    this.obscureText,
    this.validator,
  });
  final String hintText;
  final String? labelText;
  final int maxLines;
  final double? borderRadius;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final IconButton? trailingIcon;
  final double? borderWidth;
  final bool? obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              // return "$labelText is required";
              return labelText == null
                  ? "$hintText is required"
                  : "$labelText is required";
            } else {
              return null;
            }
          },
      cursorColor: ColorManager.mainColor,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      style: Styles.textStyle14.copyWith(
          color: ColorManager.barColor,
          fontFamily: FontType.kRoboto,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        // Set the floatingLabelBehavior to always --> to make label and hint in same time
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: Styles.textStyle14.copyWith(
            color: ColorManager.mainColor, fontFamily: FontType.kRoboto),
        hintText: hintText,
        hintStyle: Styles.textStyle14.copyWith(
            color: ColorManager.barColor, fontFamily: FontType.kRoboto),
        border: buidBorder(borderRadius: borderRadius),
        enabledBorder: buidBorder(borderRadius: borderRadius),
        fillColor: ColorManager.mainColor,
        focusedBorder: buidBorder(
            borderColor: ColorManager.mainColor, borderRadius: borderRadius),
        suffixIcon: trailingIcon,
      ),
    );
  }

  OutlineInputBorder buidBorder({Color? borderColor, double? borderRadius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 4),
      borderSide: BorderSide(
          color: borderColor ?? ColorManager.mainColor,
          width: borderWidth ?? 1),
    );
  }
}
