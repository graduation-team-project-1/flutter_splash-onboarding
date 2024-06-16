
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BabyHomeViewAppBar extends StatelessWidget {
  const BabyHomeViewAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.onImageTap,
  });
  final String title;
  final String subTitle;
  final String imagePath;
  final VoidCallback onImageTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: onImageTap,
        child: CircleAvatar(
          radius: 35,
          backgroundImage: CachedNetworkImageProvider(
            imagePath,
          ),
        ),
      ),
      title: Text(
        title,
        style: Styles.textStyle18.copyWith(color: ColorManager.mainColor),
      ),
      subtitle: Text(
        subTitle,
        style: Styles.textStyle16.copyWith(
            fontFamily: FontType.kRoboto,
            letterSpacing: 0.96,
            color: ColorManager.blackColor),
      ),
    );
  }
}
