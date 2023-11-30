import 'package:app/constants.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const textStyle12 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: kInter);

  static const textStyle14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: kRoboto,
      color: ColorManager.mainColor);

  static const textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: kInter);

  static const textStyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: kRoboto);

  static const textStyle20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  static const textStyle24 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: kRoboto);

  static const textStyle30 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w900, fontFamily: kInter);
}
