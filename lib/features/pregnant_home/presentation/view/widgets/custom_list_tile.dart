import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        scale: 3,
      ),
      title: Text(
        title,
        style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
            fontFamily: FontType.kRoboto,
            color: ColorManager.blackColor),
      ),
      subtitle: Text(subTitle,
          style: Styles.textStyle18.copyWith(
            color: ColorManager.mainColor,
          )),
    );
  }
}
