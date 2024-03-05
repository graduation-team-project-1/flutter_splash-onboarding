import 'package:app/core/resource/values_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/main/article/presentation/view/articles_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailValue,
    required this.passwordValue,
  });

  final bool emailValue;
  final bool passwordValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizeManager.s60,
      child: CustomButton(
        onPressed: (emailValue && passwordValue)
            ? () {
                Get.to(const ArticlesScreen());
                print("$emailValue && $passwordValue");
              }
            : null,
        buttonTitle: "Log in",
      ),
    );
  }
}
