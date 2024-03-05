import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/dependency_injection.dart';
import 'package:app/core/resource/share_pref.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/register/view/register_view.dart';
import 'package:app/features/on_boarding/view/on_boaeding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart ' as get_value;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  int _checkValue = 0;
  final sharedPref = instance.get<AppSharedPref>();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          _checkValue = 1;
        });
      },
    );
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _checkValue == 0
        ? Container(
            color: ColorManager.whiteColor,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _checkValue == 0 ? 1 : 0,
                  duration: const Duration(seconds: 3),
                  child: SvgPicture.asset(
                    ImagesPath.logo1,
                  ),
                ),
                Text(
                  StringManager.appName,
                  style: Styles.textStyle52.copyWith(
                    height: 0.01,
                    color: ColorManager.mainColor,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  StringManager.motherAndBabyCare,
                  style: Styles.textStyle12.copyWith(
                    color: ColorManager.mainColor,
                  ),
                ),
              ],
            ),
          ).animate().fadeOut(
              delay: const Duration(seconds: 2),
              duration: const Duration(seconds: 3),
            )
        : Container(
            color: ColorManager.mainColor,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagesPath.logo2,
                ),
                Text(
                  StringManager.appName,
                  style: Styles.textStyle52.copyWith(
                    height: 0.01,
                    color: ColorManager.whiteColor,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  StringManager.motherAndBabyCare,
                  style: Styles.textStyle12.copyWith(
                    color: ColorManager.whiteColor,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(
              duration: const Duration(seconds: 2),
            );
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 6),
      () async {
        if (await sharedPref.getOnBoarding()) {
          get_value.Get.to(
            () => const RegisterView(),
            transition: get_value.Transition.fadeIn,
          );
        } else {
          get_value.Get.to(
            () => const OnBoardingView(),
            transition: get_value.Transition.fadeIn,
          );
        }
      },
    );
  }
}
