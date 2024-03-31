import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/forget%20password/view/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom().customAppbar(),
      body: const SingleChildScrollView(
        child: ForgetPasswordView(),
      ),
    );
  }
}
