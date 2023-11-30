import 'package:app/core/resource/assets.dart';
import 'package:app/features/on_boarding/view/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          imagePath: ImagesPath.pregnancyTracking,
          subTitle:
              "Track the weekly development of the fetus throughout the months of pregnancy.",
          title: "Pregnancy tracking",
        ),
        PageViewItem(
          imagePath: ImagesPath.postpartumCare,
          subTitle:
              "Provide advice to mothers to maintain their health and the health of their children physically and mentally after birth.",
          title: "Postpartum care",
        ),
        PageViewItem(
          imagePath: ImagesPath.analysisOfBabyCrying,
          subTitle:
              "Analyze the child's crying and provides appropriate solutions and suggestions for the reason for the crying.",
          title: "Analysis of baby crying",
        ),
        PageViewItem(
          imagePath: ImagesPath.babyMonitoring,
          subTitle:
              "Allow mothers to monitor their child while they are alone in a specific place",
          title: "Baby monitoring",
        )
      ],
    );
  }
}
