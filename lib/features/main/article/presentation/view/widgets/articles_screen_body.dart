import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/article/presentation/view/spacific_item_screen.dart';
import 'package:app/features/main/article/presentation/view/widgets/articles_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesScreenBody extends StatelessWidget {
  const ArticlesScreenBody({super.key,this.isBoy});
  final bool? isBoy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 30,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Articles",
              style: Styles.textStyle20.copyWith(
                color: (isBoy == null)
                  ? ColorManager.mainColor
                  : (isBoy == true
                      ? ColorManager.boyBabyName
                      : ColorManager.girlBabyName),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomArticleItem(
              title: "Nutrition",
              imageUrl: ImagesPath.fruit,
              onPressed: () {
                Get.to(
                  const SpacificItemScreen(titleName: "Nutrition"),
                );
              },
            ),
            CustomArticleItem(
              title: "Exercises",
              imageUrl: ImagesPath.exercises,
              onPressed: () {
                Get.to(
                  const SpacificItemScreen(titleName: "Exercises"),
                );
              },
            ),
            CustomArticleItem(
              title: "Common diseases",
              imageUrl: ImagesPath.diseases,
              onPressed: () {
                Get.to(
                  const SpacificItemScreen(titleName: "Common diseases"),
                );
              },
            ),
            CustomArticleItem(
              title: "Sleep",
              imageUrl: ImagesPath.sleep,
              onPressed: () {
                Get.to(
                  const SpacificItemScreen(titleName: "Sleep"),
                );
              },
            ),
            CustomArticleItem(
              title: "General Topic",
              imageUrl: ImagesPath.general,
              onPressed: () {
                Get.to(
                  const SpacificItemScreen(titleName: "General Topic"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
