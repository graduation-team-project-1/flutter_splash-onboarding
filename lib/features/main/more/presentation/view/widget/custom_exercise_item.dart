import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/more/presentation/view/widget/custom_youtube_image.dart';
import 'package:flutter/material.dart';

class CustomExerciseItem extends StatelessWidget {
  const CustomExerciseItem({super.key, required this.youtubeLink});
  final String youtubeLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * .9,
      height: 120,
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            CustomYoutubeImage(
              youtubeLink: youtubeLink,
              height: 100,
              width: 130,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Exercise for Pregnancy',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.robotoTextStyle14.copyWith(
                      color: ColorManager.mainColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Watch and learn exercises for each trimester Watch and learn exercises for each trimesterWatch and learn exercises for each trimesterWatch and learn exercises for each trimesterWatch and learn exercises for each trimester',
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle10.copyWith(
                      color: ColorManager.barColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
