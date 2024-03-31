import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateTimeAlarm extends StatelessWidget {
  const DateTimeAlarm(
      {super.key, required this.formattedDate, required this.hasNotification});
  final bool hasNotification;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          formattedDate,
          style: Styles.textStyle10.copyWith(color: ColorManager.dateColor),
        ),
        const HorizintalSpace(.5),
        if (hasNotification) SvgPicture.asset(ImagesPath.alarmIcon)
      ],
    );
  }
}
