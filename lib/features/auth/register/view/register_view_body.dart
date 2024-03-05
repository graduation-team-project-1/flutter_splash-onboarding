import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/login/view/login_view.dart';
import 'package:app/features/auth/user%20data/view/user_role.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  bool checkListValue = false;

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppPaddingManager.p35,
        left: AppPaddingManager.p8,
        right: AppPaddingManager.p8,
        bottom: AppPaddingManager.p20,
      ),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(ImagesPath.register),
            GradientText(
              text: StringManager.joinUs,
              gradient: ColorManager.primaryColorGradient,
              style: TextStyle(
                fontSize: FontSizeManager.s32,
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.defultSize! * 2,
            ),
            CustomeInputFiled(
              hintText: StringManager.registerName,
              controller: nameController,
              errorText: StringManager.registerNameError,
              isPassword: false,
            ),
            SizedBox(
              height: SizeConfig.defultSize! * 0.9,
            ),
            CustomeInputFiled(
              hintText: StringManager.registerEmail,
              controller: emailController,
              errorText: StringManager.emailAddressError,
              isPassword: false,
            ),
            SizedBox(
              height: SizeConfig.defultSize! * 0.9,
            ),
            CustomeInputFiled(
              hintText: StringManager.password,
              controller: passwordController,
              errorText: StringManager.passwordError,
              isPassword: true,
            ),
            SizedBox(
              height: SizeConfig.defultSize! * 0.9,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Checkbox.adaptive(
                    value: checkListValue,
                    onChanged: (newValue) {
                      setState(
                        () {
                          checkListValue = newValue!;
                        },
                      );
                    },
                  ),
                ),
                const Text(
                  StringManager.policy,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.defultSize! * 0.9,
            ),
            SizedBox(
              height: AppSizeManager.s60,
              width: double.infinity,
              child: CustomButton(
                buttonTitle: "Sign up",
                onPressed: checkValidation()
                    ? () {
                        _focusNode.unfocus();
                        Get.to(
                          const UserRole(),
                        );
                      }
                    : null,
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
                      const LoginView(),
                    );
                  },
                  child: GradientText(
                    text: StringManager.login,
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
      ),
    );
  }

  bool checkValidation() {
    return emailController.text.isEmpty &&
            passwordController.text.isEmpty &&
            nameController.text.isEmpty
        ? false
        : true;
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
