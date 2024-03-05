import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: FontType.kInter,
  );
  static const robotoTextStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: FontType.kRoboto,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontType.kTeko,
    color: ColorManager.mainColor,
  );
  static const robotoTextStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontType.kRoboto,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: FontType.kInter,
  );
  static const robotoTextStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: FontType.kRoboto,
    color: ColorManager.mainColor,
  );

  static const textStyle18 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, fontFamily: FontType.kRoboto);

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily:FontType.kRoboto,
  );

  static const textStyle24 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w700, fontFamily: FontType.kRoboto);

  static const textStyle30 = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w900, fontFamily: FontType.kInter);

  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: FontType.kRoboto,
  );

  static const textStyle52 = TextStyle(
      fontSize: 52, fontWeight: FontWeight.w700, fontFamily: FontType.kTeko);
}
