
import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DateContinueButton extends StatelessWidget {
  const DateContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        buttonTitle: "continue",
        onPressed: () {},
      ),
    );
  }
}
