import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // backgroundColor: ColorManager.inpuDecorationColor,
      content: Text(message)));
}
