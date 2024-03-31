import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/article/presentation/view/widgets/articles_custom_image.dart';
import 'package:app/features/main/article/presentation/view/widgets/custom_view_more.dart';
import 'package:flutter/material.dart';

class CustomArticleItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onPressed; // this is onPressed to view all data about item

  const CustomArticleItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 22,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.textStyle24.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                  fontSize: 19,
                ),
              ),
              CustomViewMore(
                onPressed: () => onPressed(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomImage(
            imageUrl: imageUrl,
          ),
        ],
      ),
    );
  }
}
