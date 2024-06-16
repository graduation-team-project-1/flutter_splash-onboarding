// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/pregnant_home/view/pregnant_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    this.isBoy,
  }) : super(key: key);

  final bool? isBoy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        buttonTitle: "Continue",
        onPressed: () {
          Get.to(
            PregnantHomeView(
              isBoy: isBoy,
            ),
          );
        },
      ),
    );
  }
}
