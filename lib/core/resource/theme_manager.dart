import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.whiteColor,
        iconTheme: IconThemeData(color: ColorManager.blackColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: AppSizeManager.s18,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeManager.s8,
          ),
        ),
        suffixIconColor: ColorManager.mainColor,
      ),
    );
  }
}
