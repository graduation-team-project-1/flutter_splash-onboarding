import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Spacer(flex: 2),
        const VerticalSpace(10),
        SizedBox(
          height: SizeConfig.defaultSize! * 30,
          child: SvgPicture.asset(imagePath),
        ),
        const VerticalSpace(5),
        GradientText(
          text: title,
          style: Styles.textStyle24,
          gradient: ColorManager.primaryColorGradient,
        ),

        const VerticalSpace(2),
        SizedBox(
          width: SizeConfig.defaultSize! * 35,
          child: Text(
            subTitle,
            style: Styles.textStyle14,
            textAlign: TextAlign.center,
          ),
        ),

        // Spacer(flex: 3),
      ],
    );
  }
}
