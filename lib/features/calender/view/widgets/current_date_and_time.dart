import 'package:app/core/resource/string_manage.dart';
import 'package:flutter/material.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';

class CurrentDateAndTime extends StatelessWidget {
  const CurrentDateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = StringManager().getCurrentFormattedDate();
    return Text(
      formattedDate,
      style: Styles.textStyle14.copyWith(
        color: ColorManager.barColor,
        fontFamily: FontType.kRoboto,
      ),
    );
  }
}
