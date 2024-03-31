
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
  });
  final String itemName;
  final String itemImage;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 312,
        height: 184,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorManager.mainColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          color: ColorManager.moreBackgroundColor,
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
                color: ColorManager.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
