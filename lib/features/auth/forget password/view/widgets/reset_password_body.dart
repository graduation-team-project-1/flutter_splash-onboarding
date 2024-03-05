import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Custom().customPic(
            url: ImagesPath.resetPassword,
            context: context,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 28.0, bottom: 16),
            child: GradientText(
              text: "Reset Password",
              gradient: ColorManager.primaryColorGradient,
              style: Styles.textStyle32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CustomeInputFiled(
              hintText: "New Password",
              controller: _passwordController,
              errorText: "Please Enter Valid Password",
              isPassword: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CustomeInputFiled(
              hintText: "Confirm New Password",
              controller: _confirmPasswordController,
              errorText: "Password don't match",
              isPassword: true,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 24),
            height: 90,
            child: CustomButton(
              buttonTitle: "Submiting",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
