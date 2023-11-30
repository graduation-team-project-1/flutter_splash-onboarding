import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/on_boarding/view/on_boaeding_view.dart';
import 'package:app/features/splash/view/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    goToNextView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorManager.primaryColorGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagesPath.logo),
              // Image.asset(
              //   ImagesPath.logo,
              //   scale: 3.5,
              // ),
              Text(
                StringManager.appName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 0.01,
                    ),
              ),
              const SizedBox(height: 25),
              SlidingText(slidingAnimation: slidingAnimation)
            ],
          ),
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(() => const OnBoardingView(), transition: Transition.fade);
      },
    );
  }
}
