import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/forget%20password/view/widgets/otp_code_body.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom().customAppbar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: OtpPageBody(),
        ),
      ),
    );
  }
}
