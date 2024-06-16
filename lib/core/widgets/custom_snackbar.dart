import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String message;
  final Color? backGroundColor;

  CustomSnackBar({super.key, required this.message, this.backGroundColor})
      : super(
          content: Text(
            message,
            style: Styles.robotoTextStyle14
                .copyWith(color: ColorManager.whiteColor),
          ),
          backgroundColor: backGroundColor ?? ColorManager.mainColor,
        );

  static void show(BuildContext context, String message,
      {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar(
        message: message,
        backGroundColor: backgroundColor,
      ),
    );
  }
}
