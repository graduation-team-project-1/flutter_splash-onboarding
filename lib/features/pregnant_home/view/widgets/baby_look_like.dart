import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_look_like_view.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BabyLookLikeCard extends StatelessWidget {
  const BabyLookLikeCard(
      {super.key,
      required this.title,
      required this.image,
      required this.currentWeek});
  final String title;
  final String image;
  final int currentWeek;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const BabyLookLikeView(currentWeek: 23),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        width: double.infinity,
        height: 10.5 * SizeConfig.defultSize!,
        decoration: ShapeDecoration(
          color: ColorManager.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
        ),
        child: Center(
          child: ListTile(
            leading: CustomImageDisplay(
              imageUrl: image,
              height: 7.5 * SizeConfig.defultSize!,
              width: 8 * SizeConfig.defultSize!,
              fit: BoxFit.cover,
            ),
            title: Text(
              StringManager.mybabyislike,
              style: Styles.textStyle16.copyWith(
                  color: ColorManager.mainColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontType.kRoboto),
            ),
            subtitle: Text(
              title,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorManager.mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
