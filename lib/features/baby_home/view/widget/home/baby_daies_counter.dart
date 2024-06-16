
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BabyDaiesCounter extends StatelessWidget {
  const BabyDaiesCounter({super.key, required this.isBoy});
  final bool isBoy;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: ColorManager.whiteColor,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, top: 14, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isBoy
                    ? ColorManager.boyBabyName
                    : ColorManager.girlBabyName,
              ),
              child: Center(
                child: SvgPicture.asset(
                  ImagesPath.boyCounter,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
                  width: 3,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "0",
                      style: Styles.robotoTextStyle18.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlBabyName,
                      ),
                    ),
                    Text(
                      "Days",
                      style: Styles.robotoTextStyle18.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlBabyName,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
