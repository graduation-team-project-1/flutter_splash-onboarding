
import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        buttonTitle: "Continue",
        onPressed: () {},
      ),
    );
  }
}
