import 'package:app/features/main/more/presentation/view/widget/nutriation/nutriation_card_spacific_item.dart';
import 'package:app/features/main/more/presentation/view/widget/nutriation/nutriation_row_item.dart';
import 'package:app/features/main/more/data/model/nutrition_model.dart';
import 'package:flutter/material.dart';

class NutitionSpacificCategory extends StatelessWidget {
  const NutitionSpacificCategory({
    super.key,
    required this.onPressed,
    required this.nutritionModelFirtsItem,
    required this.nutritionModelSecondItem,
    required this.categoryTitle,
  });
  final VoidCallback onPressed;
  final NutritionModel nutritionModelFirtsItem;
  final NutritionModel nutritionModelSecondItem;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NutritionRowItems(
          onPressed: onPressed,
          categoryTitle: categoryTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            NutritionCardItem(
              nutritionModel: nutritionModelFirtsItem,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: NutritionCardItem(
                nutritionModel: nutritionModelSecondItem,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
