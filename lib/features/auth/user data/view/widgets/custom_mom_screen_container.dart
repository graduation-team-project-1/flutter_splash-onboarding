import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/user%20data/view/baby_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomMomContainer extends StatelessWidget {
  const CustomMomContainer({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.imageUrl,
  });
  final Color backgroundColor;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Get.to(
            BabyData(isBoy: title == "Boy"),
            // BabyData()
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                ImagesPath.bannerDots,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle24
                        .copyWith(color: ColorManager.whiteColor),
                  ),
                  SvgPicture.asset(
                    imageUrl,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
