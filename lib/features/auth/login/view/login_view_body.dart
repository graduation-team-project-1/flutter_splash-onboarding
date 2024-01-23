import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/forget%20password/view/forget_password_view.dart';
import 'package:app/features/auth/register/view/register_view.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool inputFiledError = true;

  bool change(TextEditingController inputFiledController) {
    if (inputFiledController.text.isEmpty) {
      setState(() {
        inputFiledError = !inputFiledError;
      });
    } else {
      inputFiledError = inputFiledError;
    }
    return inputFiledError;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppPaddingManager.p28,
        left: AppPaddingManager.p8,
        right: AppPaddingManager.p8,
      ),
      child: Column(
        children: [
          SvgPicture.asset(ImagesPath.login),
          GradientText(
            text: StringManager.welcomeBack,
            gradient: ColorManager.primaryColorGradient,
            style: TextStyle(
              fontSize: FontSizeManager.s32,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: AppSizeManager.s28,
          ),
          CustomeInputFiled(
            hintText: StringManager.emailAddress,
            controller: emailController,
            errorText: StringManager.emailAddressError,
            isPassword: false,
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          CustomeInputFiled(
            hintText: StringManager.password,
            controller: passwordController,
            errorText: StringManager.passwordError,
            isPassword: true,
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Get.to(
                  const ForgetPasswordView(),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 600),
                );
              },
              child: Text(
                StringManager.forgetPassword,
                style: TextStyle(
                  color: ColorManager.mainColor,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.mainColor,
                elevation: AppSizeManager.s0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizeManager.s8),
                ),
              ),
              onPressed: () {},
              child: Text(
                StringManager.login,
                style: TextStyle(
                  color: ColorManager.whiteColor,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          Text(
            StringManager.or,
            style: TextStyle(
              color: ColorManager.mainColor,
              fontSize: FontSizeManager.s14,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: AppSizeManager.s1,
                    color: ColorManager.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(AppSizeManager.s8)),
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
          ),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          Row(
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
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 600),
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
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
