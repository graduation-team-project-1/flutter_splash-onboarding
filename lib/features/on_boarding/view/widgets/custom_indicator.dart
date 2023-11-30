import 'package:app/core/resource/color_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.currentDotIndex});
  final double? currentDotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: ColorManager.mainColor,
          activeSize: const Size(16, 7),
          size: const Size(7, 7),
          spacing: const EdgeInsets.all(3.5),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side:
                  BorderSide(color: ColorManager.mainColor.withOpacity(.75)))),
      dotsCount: 4,
      position: currentDotIndex!.toInt(),
    );
  }
}
