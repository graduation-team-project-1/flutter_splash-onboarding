import 'package:app/core/resource/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _textStyleManager(
    {required Color fontColor,
    required double textSize,
    required FontWeight textWeight}) {
  return TextStyle(
    fontFamily: FontType.fontStyle,
    color: fontColor,
    fontSize: textSize,
    fontWeight: textWeight,
  );
}

TextStyle tekoLightTextManger({
  required Color fontColor,
  required double textSize,
}) {
  return _textStyleManager(
    fontColor: fontColor,
    textSize: textSize,
    textWeight: FontWeightManager.light,
  );
}

TextStyle tekoRegularTextManger({
  required Color fontColor,
  required double textSize,
}) {
  return _textStyleManager(
    fontColor: fontColor,
    textSize: textSize,
    textWeight: FontWeightManager.regular,
  );
}

TextStyle tekoMediumTextManger({
  required Color fontColor,
  required double textSize,
}) {
  return _textStyleManager(
    fontColor: fontColor,
    textSize: textSize,
    textWeight: FontWeightManager.medium,
  );
}

TextStyle tekoSemiBoldTextManger({
  required Color fontColor,
  required double textSize,
}) {
  return _textStyleManager(
    fontColor: fontColor,
    textSize: textSize,
    textWeight: FontWeightManager.semiBold,
  );
}

TextStyle tekoBoldTextManger({
  required Color fontColor,
  required double textSize,
}) {
  return _textStyleManager(
    fontColor: fontColor,
    textSize: textSize,
    textWeight: FontWeightManager.bold,
  );
}
