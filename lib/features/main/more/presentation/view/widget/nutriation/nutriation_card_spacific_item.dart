
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/more/data/model/nutrition_model.dart';
import 'package:flutter/material.dart';

class NutritionCardItem extends StatelessWidget {
  const NutritionCardItem({
    super.key,
    required this.nutritionModel,
  });

  final NutritionModel nutritionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 183,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 0),
            blurRadius: 8,
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                nutritionModel.imagePath,
                fit: BoxFit.scaleDown,
                width: 145,
              ),
            ),
            Text(
              nutritionModel.title,
              style: Styles.robotoTextStyle14.copyWith(
                  fontWeight: FontWeight.w600, color: ColorManager.mainColor),
            ),
            Text(
              nutritionModel.description,
              style: Styles.textStyle10.copyWith(
                color: ColorManager.barColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
