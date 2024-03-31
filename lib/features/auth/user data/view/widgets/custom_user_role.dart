import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomUserRole extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double imageSize;
  final bool? isMom;

  const CustomUserRole({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.imageSize,
    this.isMom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color:  ColorManager.seconderPinkColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorManager.mainColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60, top: 30),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                ImagesPath.bannerDots,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Styles.textStyle24
                      .copyWith(color: ColorManager.pinkColor),
                ),
                SvgPicture.asset(
                  imageUrl,
                  width: imageSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
