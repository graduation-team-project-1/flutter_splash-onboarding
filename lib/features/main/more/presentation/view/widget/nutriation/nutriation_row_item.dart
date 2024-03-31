import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/more/presentation/view/widget/nutriation/nutriation_view_more_button.dart';
import 'package:flutter/material.dart';

class NutritionRowItems extends StatelessWidget {
  const NutritionRowItems({
    super.key,
    required this.onPressed,
    required this.categoryTitle,
  });
  final VoidCallback onPressed;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryTitle,
          style: Styles.textStyle20,
        ),
        NutritionViewMoreButton(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
