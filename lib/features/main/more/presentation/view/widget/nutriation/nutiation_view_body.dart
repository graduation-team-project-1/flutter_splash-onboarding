import 'package:app/core/resource/assets.dart';
import 'package:app/features/main/more/presentation/view/widget/nutriation/nutriation_spacific_category.dart';
import 'package:app/features/main/more/data/model/nutrition_model.dart';
import 'package:flutter/material.dart';

class NutritionViewBody extends StatelessWidget {
  const NutritionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Breakfaset",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "Toast and eggs",
              imagePath: ImagesPath.toastEggs,
              description: "protein, carbs , vegetables",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "Oats with milk",
              imagePath: ImagesPath.oatsMilk,
              description: "protein, carbs , vegetables",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Dinner",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "Toast with Avocado",
              imagePath: ImagesPath.toastAvocado,
              description: "protein, carbs , vegetables",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "Fruit salad with honey",
              imagePath: ImagesPath.fuitsaladHoney,
              description: "protein, carbs , vegetables",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Lunch",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "title",
              imagePath: ImagesPath.pasta,
              description: "description",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "title2",
              imagePath: ImagesPath.chicken,
              description: "description2",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Snacks",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "Nuts",
              imagePath: ImagesPath.nuts,
              description: "protein, carbs , vegetables",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "Fruit and vegetable",
              imagePath: ImagesPath.fruitVegtiables,
              description: "protein, carbs , vegetables",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Drinks",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "Lemon with mint",
              imagePath: ImagesPath.lemon,
              description: "protein, carbs , vegetables",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "mango",
              imagePath: ImagesPath.mango,
              description: "protein, carbs , vegetables",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NutitionSpacificCategory(
            categoryTitle: "Fruits",
            onPressed: () {},
            nutritionModelFirtsItem: NutritionModel(
              title: "kiwi",
              imagePath: ImagesPath.kiwi,
              description: "protein, carbs , vegetables",
            ),
            nutritionModelSecondItem: NutritionModel(
              title: "apple",
              imagePath: ImagesPath.apple,
              description: "protein, carbs , vegetables",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
