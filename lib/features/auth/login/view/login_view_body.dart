import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/features/auth/login/view/widget/email_input.dart';
import 'package:app/features/auth/login/view/widget/forgetpassword.dart';
import 'package:app/features/auth/login/view/widget/google_widget.dart';
import 'package:app/features/auth/login/view/widget/login_button.dart';
import 'package:app/features/auth/login/view/widget/navigator_text.dart';
import 'package:app/features/auth/login/view/widget/password_input.dart';
import 'package:app/features/auth/login/view/widget/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool emailValue = true;
  bool passwordValue = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      bool changingValueEmail = emailController.text.isNotEmpty;
      setState(() {
        emailValue = changingValueEmail;
      });
    });

    passwordController.addListener(() {
      final changingValuePassword = passwordController.text.isNotEmpty;
      setState(() {
        passwordValue = changingValuePassword;
      });
    });
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
          const WelcomeText(),
          const SizedBox(
            height: AppSizeManager.s28,
          ),
          EmailInput(emailController: emailController),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          PasswordInput(passwordController: passwordController),
          const ForgetPasswordText(),
          LoginButton(emailValue: emailValue, passwordValue: passwordValue),
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
          const GoogleWidget(),
          const SizedBox(
            height: AppSizeManager.s18,
          ),
          const NavigatorText()
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
