import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class BaybyInfoCardDetails extends StatelessWidget {
  const BaybyInfoCardDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 3,
        ),
        const HorizintalSpace(.8),
        Column(children: [
          Text(title,
              style: Styles.textStyle14.copyWith(
                  fontFamily: FontType.kRoboto,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.babyInfoColor)),
          Text(subTitle,
              style: Styles.textStyle12.copyWith(
                  fontFamily: FontType.kRoboto,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.babyInfoColor)),
        ]),
      ],
    );
  }
}
