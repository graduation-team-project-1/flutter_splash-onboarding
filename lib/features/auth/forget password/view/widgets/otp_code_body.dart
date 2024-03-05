import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/forget%20password/view/reset_password.dart';
import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPageBody extends StatelessWidget {
  const OtpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Custom().customPic(
            url: ImagesPath.otpCode,
            context: context,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GradientText(
              text: "Enter Code!",
              gradient: ColorManager.primaryColorGradient,
              style: Styles.textStyle32.copyWith(fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: PinCodeTextField(
              appContext: context,
              length: 5,
              autoFocus: true,
              pinTheme: PinTheme(
                fieldHeight: 65,
                fieldWidth: 65,
                inactiveBorderWidth: 2,
                inactiveColor: ColorManager.mainColor,
                activeBorderWidth: 2,
                activeColor: ColorManager.mainColor,
                selectedColor: ColorManager.mainColor,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                buttonTitle: "Reset password",
                onPressed: () {
                  Get.to(
                    const ResetPassword(),
                    transition: Transition.zoom,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  gradient: ColorManager.primaryColorGradient,
                  text: "Didn’t receive a code!",
                  style: Styles.textStyle12.copyWith(
                    fontFamily: FontType.kPoppins,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {},
                  child: GradientText(
                    gradient: ColorManager.primaryColorGradient,
                    text: "Resend",
                    style: Styles.textStyle12.copyWith(
                      fontFamily: FontType.kPoppins,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
