import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class PaymantsViewHeader extends StatelessWidget {
  const PaymantsViewHeader({super.key});
  Widget buildCustomRow(String labelText, BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            Icons.check_circle,
            color: ColorManager.likeMainColor,
          ),
        ),
        Text(
          labelText,
          style: Styles.textStyle14.copyWith(
              fontFamily: FontType.kRoboto,
              fontWeight: FontWeight.w500,
              color: ColorManager.likeMainColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.defaultSize! * 33,
      decoration: const ShapeDecoration(
        gradient: ColorManager.primaryColorGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const Spacer(flex: 2),
          Row(
            children: [
              Text(
                StringManager.unlockForAccess,
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorManager.whiteColor),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.cancel_outlined,
                  color: ColorManager.whiteColor,
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: SizeConfig.defaultSize! * 17,
            decoration: ShapeDecoration(
                color: ColorManager.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(children: [
                const Spacer(flex: 2),
                buildCustomRow(StringManager.supportPregnancy, context),
                const Spacer(),
                buildCustomRow(StringManager.removeAds, context),
                const Spacer(),
                buildCustomRow(StringManager.analysisBabCry, context),
                const Spacer(flex: 2),
              ]),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
