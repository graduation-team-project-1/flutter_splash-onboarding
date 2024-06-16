import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomeTextBabyInfo extends StatelessWidget {
  const CustomeTextBabyInfo({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.robotoTextStyle16.copyWith(
        color: ColorManager.blackColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

