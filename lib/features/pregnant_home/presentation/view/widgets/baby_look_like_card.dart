import 'package:app/core/resource/string_manage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_look_like_view.dart';
import 'package:app/core/widgets/custom_image_display.dart';

class BabyLookLikeCard extends StatelessWidget {
  const BabyLookLikeCard({super.key, required this.pregnancyModel});

  final PregnancyModel pregnancyModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: BabyLookLikeView(pregnancyModel: pregnancyModel),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        width: double.infinity,
        height: 10.5 * SizeConfig.defultSize!,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
        ),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 2 * SizeConfig.defultSize!, vertical: 0),
            leading: CustomImageDisplay(
              imageUrl: StringManager().removeSpecialCharactersAndSpaces(
                pregnancyModel.fruitsAndVeggiesPhoto ?? "",
              ),
              height: 10 * SizeConfig.defultSize!,
              width: 8 * SizeConfig.defultSize!,
              fit: BoxFit.contain,
            ),
            title: Text(
              StringManager.myBabyIsLike,
              style: Styles.textStyle16.copyWith(
                color: ColorManager.mainColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontType.kRoboto,
              ),
            ),
            subtitle: Text(
              StringManager().removeSpecialCharactersAndSpaces(
                pregnancyModel.fruitsAndVeggies ?? '',
              ),
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
