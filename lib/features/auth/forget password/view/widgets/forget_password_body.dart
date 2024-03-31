import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/auth/forget%20password/view/otp_code.dart';
import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();

  bool isbuttonActive = true;
  @override
  void initState() {
    emailController.addListener(() {
      final newButtonValue = emailController.text.isNotEmpty;
      setState(() {
        isbuttonActive = newButtonValue;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19, left: 15, right: 15),
      child: Column(
        children: [
          Custom().customPic(
            url: ImagesPath.forgetpassword,
            context: context,
          ),
          Text(
            StringManager.forgetPassword,
            style: Styles.textStyle32.copyWith(color: ColorManager.mainColor),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomeInputFiled(
            hintText: StringManager.emailAddress,
            controller: emailController,
            errorText: StringManager.emailAddressError,
            isPassword: false,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              height: AppSizeManager.s60,
              child: CustomButton(
                buttonTitle: "Send code",
                onPressed: isbuttonActive
                    ? () {
                        Get.to(
                          const OtpPage(),
                        );
                      }
                    : null,
              ))
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
