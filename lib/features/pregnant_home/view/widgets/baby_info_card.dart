import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/models/custom_paint.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_Inof_card_view.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_info_card_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BabyInfoCard extends StatelessWidget {
  const BabyInfoCard({super.key, required this.currentWeek});
  final int currentWeek;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const BabyCardInfoView(currentWeek: 23),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: SizeConfig.defultSize! * 41,
        width: double.infinity,
        decoration: ShapeDecoration(
            gradient: ColorManager.boxColorGradient,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: SizeConfig.defultSize! * 0.33,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: ColorManager.mainColor,
              ),
              borderRadius: BorderRadius.circular(SizeConfig.defultSize! * 0.8),
            ),
            shadows: getCardBoxShadow(
                blurRadius: SizeConfig.defultSize! * 0.8,
                spreadRadius: SizeConfig.defultSize! * 1)),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              CustomPaint(
                size: Size(SizeConfig.defultSize! * 24.2,
                    SizeConfig.defultSize! * 26.4),
                painter: RPSCustomPainter(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.defultSize! * 1.2,
                      left: SizeConfig.defultSize! * 4,
                      right: SizeConfig.defultSize! * 0.4,
                      bottom: 0,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://babyjoyjoy.com/wp-content/uploads/2023/04/Week-$currentWeek-Pregnancy.png',
                            width: SizeConfig.defultSize! * 21,
                            height: SizeConfig.defultSize! * 21,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: SizeConfig.defultSize! * 20,
                left: SizeConfig.defultSize! * 9,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '72 \n',
                        style: Styles.textStyle18.copyWith(
                          color: ColorManager.babyInfoColor,
                        ),
                      ),
                      TextSpan(
                        text: StringManager.daysToGo,
                        style: Styles.textStyle16.copyWith(
                          color: ColorManager.babyInfoColor,
                          fontFamily: FontType.kInter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: SizeConfig.defultSize! * .5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BaybyInfoCardDetails(
                        image: ImagesPath.lengthIcon,
                        title: "39.9 cm",
                        subTitle: StringManager.length),
                    Container(
                      height: SizeConfig.defultSize! * 5,
                      width: SizeConfig.defultSize! * .25,
                      decoration: ShapeDecoration(
                          gradient: ColorManager.primaryColorGradient,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: SizeConfig.defultSize! * .001,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: ColorManager.mainColor,
                            ),
                          )),
                    ),
                    const BaybyInfoCardDetails(
                        image: ImagesPath.weightIcon,
                        title: "1.3-1.32 kg",
                        subTitle: StringManager.weight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
