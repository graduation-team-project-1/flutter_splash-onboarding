import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/features/profile/presentation/view/widgets/change_password_view.dart';
import 'package:flutter/material.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationUtils.navigateToScreen(
            context, const ChangePasswordView(), false);
      },
      child: Container(
          decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: ColorManager.mainColor),
              )),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(
              StringManager.changePassword,
              style: Styles.textStyle14.copyWith(
                  fontFamily: FontType.kRoboto, color: ColorManager.barColor),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorManager.mainColor,
              size: SizeConfig.defultSize! * 2,
            ),
          )),
    );
  }
}
