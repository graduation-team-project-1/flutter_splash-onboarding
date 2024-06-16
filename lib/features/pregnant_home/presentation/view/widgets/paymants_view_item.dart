import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class PaymantsViewItem extends StatelessWidget {
  const PaymantsViewItem(
      {super.key, required this.duration, required this.price});
  final String duration;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! / 3.8,
      height: SizeConfig.defaultSize! * 15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: ColorManager.primaryColorGradient),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                Text(
                  duration,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14.copyWith(
                      color: ColorManager.likeMainColor,
                      fontFamily: FontType.kRoboto,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(
                    color: ColorManager.likeGirlColor,
                    fontFamily: FontType.kRoboto,
                  ),
                ),
                const Spacer(flex: 4),
              ]),
        ),
      ),
    );
  }
}
