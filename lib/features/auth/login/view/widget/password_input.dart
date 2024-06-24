
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomeInputFiled(
      hintText: StringManager.password,
      controller: passwordController,
      errorText: StringManager.passwordError,
      isPassword: true,
    );
  }
}
