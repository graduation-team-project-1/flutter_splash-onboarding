
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class NutritionViewMoreButton extends StatelessWidget {
  const NutritionViewMoreButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            "View all",
            style: Styles.textStyle16.copyWith(
              color: ColorManager.mainColor,
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: ColorManager.mainColor,
          )
        ],
      ),
    );
  }
}
