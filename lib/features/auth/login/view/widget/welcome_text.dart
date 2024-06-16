
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text: StringManager.welcomeBack,
      gradient: ColorManager.primaryColorGradient,
      style: TextStyle(
        fontSize: FontSizeManager.s32,
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
