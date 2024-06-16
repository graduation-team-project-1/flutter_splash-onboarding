
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleWidget extends StatelessWidget {
  const GoogleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          border: Border.all(
            width: AppSizeManager.s1,
            color: ColorManager.mainColor,
          ),
          borderRadius: BorderRadius.circular(AppSizeManager.s8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesPath.google),
            const SizedBox(
              width: AppSizeManager.s14,
            ),
            const Text(
              StringManager.continueWithGoogle,
              style: TextStyle(color: ColorManager.mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
