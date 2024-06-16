import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDateCart extends StatelessWidget {
  const CustomDateCart({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: ColorManager.textFormFieldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      leading: SvgPicture.asset(
        ImagesPath.dateIcon,
      ),
      title: Text(
        "Date",
        style: Styles.textStyle14.copyWith(
          fontFamily: FontType.kRoboto,
          fontWeight: FontWeight.w800,
          color: ColorManager.timeColor,
        ),
      ),
      subtitle: Text(
        "1:00 PM-4:30 PM",
        style: Styles.textStyle10.copyWith(
          color: ColorManager.dateColor,
        ),
      ),
    );
  }
}
