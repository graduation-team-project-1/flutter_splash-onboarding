import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:flutter/material.dart';

class CustomTrimesterIndicator extends StatelessWidget {
  const CustomTrimesterIndicator({
    super.key,
    this.trimester,
    this.isFinal = false,
    required this.val,
    required this.maxVal,
  });
  final bool isFinal;
  final String? trimester;

  final double val;
  final double maxVal;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: maxVal > val ? .5 : 1.0,
      child: Container(
          height: SizeConfig.defaultSize! * 2,
          width: SizeConfig.defaultSize! * 2,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.lightPink,
          ),
          child: Center(
            child: isFinal
                ? const Icon(
                    Icons.check,
                    color: ColorManager.whiteColor,
                    size: 16,
                  )
                : Text(
                    trimester!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
          )),
    );
  }
}
