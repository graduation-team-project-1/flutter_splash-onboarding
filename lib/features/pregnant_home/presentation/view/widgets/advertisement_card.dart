import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const PaymantsView(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        width: double.infinity,
        height: 10.5 * SizeConfig.defultSize!,
        decoration: ShapeDecoration(
          gradient: ColorManager.primaryColorGradient,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
        ),
        child: Center(
          child: ListTile(
            leading: SvgPicture.asset(
              ImagesPath.advertisementIcon,
              fit: BoxFit.fill,
            ),
            title: Text(
              StringManager.trySuperPower,
              style: Styles.textStyle18.copyWith(
                color: ColorManager.whiteColor,
              ),
            ),
            subtitle: Text(
              StringManager.daysFree,
              style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManager.whiteColor,
                  fontFamily: FontType.kRoboto),
            ),
          ),
        ),
      ),
    );
  }
}
