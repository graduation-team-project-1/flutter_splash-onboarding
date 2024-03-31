
import 'package:app/features/auth/widgets/custome_input_filed.dart';
import 'package:flutter/material.dart';

class BabyBirthDay extends StatefulWidget {
  const BabyBirthDay({
    super.key,
  });

  @override
  State<BabyBirthDay> createState() => _BabyBirthDayState();
}

class _BabyBirthDayState extends State<BabyBirthDay> {
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
