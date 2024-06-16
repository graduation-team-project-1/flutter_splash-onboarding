import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/user%20data/view/widgets/banner.dart';
import 'package:app/features/auth/user%20data/view/widgets/conception_section.dart';
import 'package:app/features/auth/user%20data/view/widgets/estimated_section.dart';
import 'package:app/features/auth/user%20data/view/widgets/last_period_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PregnantBody extends StatelessWidget {
  const PregnantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImagesPath.pregnantScreen,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Select Your Due Date",
                style: Styles.textStyle24.copyWith(
                  color: ColorManager.pinkColor,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const LastPeriodSection(),
              const SizedBox(
                height: 16,
              ),
              const EstimatedSection(),
              const SizedBox(
                height: 16,
              ),
              const ConceptionSection(),
            ],
          ),
        ),
        const CustomBanner(),
      ],
    );
  }
}
