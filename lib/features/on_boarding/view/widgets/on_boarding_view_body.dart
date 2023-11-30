import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/auth/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'custom_indicator.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
          bottom: SizeConfig.defultSize! * 21,
          left: SizeConfig.defultSize! * 13,
          right: SizeConfig.defultSize! * 13,
          child: CustomIndicator(
            currentDotIndex:
                pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Positioned(
          left: SizeConfig.defultSize! * 3,
          right: SizeConfig.defultSize! * 3,
          bottom: SizeConfig.defultSize! * 10,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  buttonTitle: "Skip",
                  onPressed: () {
                    Get.to(() => const RegisterView(),
                        transition: Transition.zoom,
                        duration: const Duration(milliseconds: 600));
                  },
                  backgroundColor: ColorManager.whiteColor,
                  textColor: ColorManager.mainColor,
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    if (pageController!.page! < 3) {
                      pageController!.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn);
                    } else {
                      Get.to(() => const RegisterView(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 600));
                    }
                  },
                  buttonTitle: pageController!.hasClients
                      ? pageController!.page == 3
                          ? 'Get Started'
                          : 'Next'
                      : 'Next',
                  textColor: null,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
