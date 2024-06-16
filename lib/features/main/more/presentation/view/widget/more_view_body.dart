import 'package:app/core/resource/assets.dart';
import 'package:app/features/main/more/presentation/view/baby_name_view.dart';
import 'package:app/features/main/more/presentation/view/exercies_view.dart';
import 'package:app/features/main/more/presentation/view/nutriation_more_view.dart';
import 'package:app/features/main/more/presentation/view/widget/more_custom_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key, this.isBoy});
  final bool? isBoy;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomItemMoreScreen(
              isBoy: isBoy,
              itemName: "Nutrition",
              itemImage: ImagesPath.nutriationMore,
              onPressed: () {
                Get.to(
                  const NutritionView(),
                );
              },
            ),
            const SizedBox(height: 6),
            CustomItemMoreScreen(
              isBoy: isBoy,
              itemName: "Exercise",
              itemImage: ImagesPath.exrciesesMore,
              onPressed: () {
                Get.to(
                  const ExerciesView(),
                );
              },
            ),
            const SizedBox(height: 6),
            CustomItemMoreScreen(
              isBoy: isBoy,
              itemName: "Baby's Name",
              itemImage: ImagesPath.babyNameMore,
              onPressed: () {
                Get.to(
                  const BabyNameScreenView(),
                );
              },
            ),
            SizedBox(
              height: 6,
            ),
            Visibility(
              child: CustomItemMoreScreen(
                isBoy: isBoy,
                itemName: "Cry Analyzer",
                itemImage: ImagesPath.cryAnalyzer,
                onPressed: () {},
              ),
              visible: isBoy != null,
              replacement: SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
