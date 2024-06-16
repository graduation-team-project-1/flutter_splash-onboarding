import 'package:app/core/resource/values_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/pregnant_home/presentation/view/pregnant_home_view.dart';
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
                Get.to(const PregnantHomeView(),);
              }
            : null,
        buttonTitle: "Log in",
      ),
    );
  }
}
