import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              StringManager.motherAndBabyCare,
              style: Styles.textStyle12
                  .copyWith(letterSpacing: 5, color: ColorManager.whiteColor),
            ),
          );
        });
  }
}
