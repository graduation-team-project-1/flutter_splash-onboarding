
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomeInputFiled(
      hintText: StringManager.emailAddress,
      controller: emailController,
      errorText: StringManager.emailAddressError,
      isPassword: false,
    );
  }
}
