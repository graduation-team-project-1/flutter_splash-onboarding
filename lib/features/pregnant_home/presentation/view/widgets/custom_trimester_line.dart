import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:flutter/material.dart';

class CustomTrimesterLine extends StatelessWidget {
  const CustomTrimesterLine(
      {super.key, required this.val, this.opacity, required this.maxVal});
  final double val;
  final double? opacity;
  final double maxVal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: SizeConfig.defultSize! * .5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.lightPink.withOpacity(val < maxVal ? 0.2 : 1.0),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerRight,
          widthFactor: 1.0 - (val / maxVal),
          child: Container(
            height: 5,
            decoration: const BoxDecoration(color: ColorManager.whiteColor),
          ),
        ),
      ),
    );
  }
}
