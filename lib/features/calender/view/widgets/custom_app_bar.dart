import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.textColor, this.iconColor});
  final Color? textColor;
  final Color? iconColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: iconColor ?? ColorManager.blackColor,
          ),
        ),
        const HorizintalSpace(2),
        Text(
          title ?? "",
          style: Styles.textStyle20.copyWith(
            color: textColor ?? ColorManager.mainColor,
            fontFamily: FontType.kRoboto,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class CustomAppBarWithDelete extends StatelessWidget {
  const CustomAppBarWithDelete(
      {super.key, required this.title, required this.deleteOnTap});
  final String title;
  final VoidCallback deleteOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        const HorizintalSpace(2),
        Text(
          title,
          style: Styles.textStyle20.copyWith(
            color: ColorManager.mainColor,
            fontFamily: FontType.kRoboto,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(14),
          child: GestureDetector(
            onTap: deleteOnTap,
            child: SvgPicture.asset(
              ImagesPath.deleteIcon,
              color: ColorManager.mainColor,
            ),
          ),
        )
      ],
    );
  }
}

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.hasNotifcation,
    required this.onTap,
    required this.onImageTap,
    required this.styleValue
  });
  final String title;
  final String subTitle;
  final String imagePath;
  final bool hasNotifcation;
  final VoidCallback onTap;
  final VoidCallback onImageTap;
  final TextStyle styleValue;
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
        style: styleValue,
      ),
      subtitle: Text(subTitle,
          style: Styles.textStyle16.copyWith(
              fontFamily: FontType.kRoboto,
              letterSpacing: 0.96,
              color: ColorManager.blackColor)),
      trailing: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          hasNotifcation
              ? ImagesPath.hasNotificationIcon
              : ImagesPath.hasNotNotificationIcon,
          scale: 3.5,
        ),
      ),
    );
  }
}
