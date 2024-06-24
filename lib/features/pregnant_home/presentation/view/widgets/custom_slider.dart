import 'package:app/features/pregnant_home/presentation/view/widgets/custom_trimester_indicator.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_trimester_line.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.val});
  final double val;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomTrimesterIndicator(trimester: "|", maxVal: 13, val: 13),
        CustomTrimesterLine(
            val: (val >= 0 && val <= 13) ? val : 14, maxVal: 14),
        CustomTrimesterIndicator(trimester: "||", maxVal: 14, val: val),
        CustomTrimesterLine(
            val: (val >= 14 && val <= 27)
                ? val - 14
                : (val >= 28 && val <= 40)
                    ? 27 - 13
                    : 0,
            maxVal: 14),
        CustomTrimesterIndicator(
          trimester: "|||",
          maxVal: 28,
          val: val,
        ),
        CustomTrimesterLine(
            val: (val >= 28 && val <= 40) ? val - 28 : 0, maxVal: 12),
        CustomTrimesterIndicator(isFinal: true, maxVal: 40, val: val),
      ],
    );
  }
}
