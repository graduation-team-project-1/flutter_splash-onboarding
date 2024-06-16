import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemMoreScreen extends StatelessWidget {
  const CustomItemMoreScreen({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.onPressed,
     this.isBoy,
  });
  final String itemName;
  final String itemImage;
  final VoidCallback onPressed;
  final bool? isBoy;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: (isBoy == null)
                  ? ColorManager.mainColor
                  : (isBoy == true
                      ? ColorManager.boyBabyName
                      : ColorManager.girlBabyName),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          color:(isBoy == null)
                  ? ColorManager.moreBackgroundColor
                  : (isBoy == true
                      ? ColorManager.boyBabybackGround
                      : ColorManager.girlBabybackGround),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              itemImage,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              itemName,
              style: Styles.textStyle24.copyWith(
                color: (isBoy == null)
                    ? ColorManager.mainColor
                    : (isBoy == true
                        ? ColorManager.boyBabyName
                        : ColorManager.girlBabyName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
