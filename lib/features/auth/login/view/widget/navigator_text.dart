
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorText extends StatelessWidget {
  const NavigatorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          StringManager.createAccount,
          style: TextStyle(color: ColorManager.mainColor),
        ),
        InkWell(
          onTap: () {
            Get.to(
              const RegisterView(),
            );
          },
          child: GradientText(
            text: StringManager.joinUs,
            gradient: ColorManager.primaryColorGradient,
            style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: FontSizeManager.s16),
          ),
        )
      ],
    );
  }
}
