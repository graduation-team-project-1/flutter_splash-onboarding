import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/font_style_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.whiteColor,
        iconTheme: IconThemeData(color: ColorManager.blackColor),
      ),
      textTheme: TextTheme(
        bodyLarge: tekoBoldTextManger(
          fontColor: ColorManager.whiteColor,
          textSize: FontSizeManager.s52,
        ),
      ),
    );
  }
}
