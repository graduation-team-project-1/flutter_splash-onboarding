
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';

class BabyName extends StatefulWidget {
  const BabyName({
    super.key,
  });

  @override
  State<BabyName> createState() => _BabyNameState();
}

class _BabyNameState extends State<BabyName> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomeInputFiled(
      hintText: "Enter baby name",
      controller: controller,
      errorText: "Baby name not valid",
      isPassword: false,
    );
  }
}
