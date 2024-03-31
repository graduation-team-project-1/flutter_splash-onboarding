import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    required this.buttonTitle,
    required this.onPressed,
    this.fontSize,
  });
  final Color? textColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String buttonTitle;
  final VoidCallback? onPressed;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8)),
            backgroundColor: backgroundColor ?? ColorManager.mainColor),
        child: Text(buttonTitle,
            style: Styles.textStyle18.copyWith(
                color: textColor ?? ColorManager.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize)),
      ),
    );
  }
}
