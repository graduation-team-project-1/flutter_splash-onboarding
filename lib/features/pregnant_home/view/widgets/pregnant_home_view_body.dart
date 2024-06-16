import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/features/calender/view/calender_view.dart';
import 'package:app/features/main/article/presentation/view/articles_screen.dart';
import 'package:app/features/main/more/presentation/view/more_view.dart';
import 'package:app/features/pregnant_home/view/widgets/pregnant_home_view_body_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PregnantHomeViewBody extends StatelessWidget {
  const PregnantHomeViewBody({super.key, this.isBoy});
  final bool? isBoy;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        PregnantHomeViewBodyContent(isBoy: isBoy),
        const CalenderView(),
         ArticlesScreen(isBoy: isBoy,),
         MoreView(isBoy:isBoy),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            ImagesPath.homeIcon,
            color: isBoy == null
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyColor
                    : ColorManager.girlBabyName),
          ),
          inactiveIcon: SvgPicture.asset(ImagesPath.homeIcon),
          title: ("Home"),
          activeColorPrimary: isBoy == null
              ? ColorManager.mainColor
              : (isBoy == true
                  ? ColorManager.boyColor
                  : ColorManager.girlBabyName),
          //   inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            ImagesPath.calenderIcon,
            color: isBoy == null
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyColor
                    : ColorManager.girlBabyName),
          ),
          inactiveIcon: SvgPicture.asset(ImagesPath.calenderIcon),
          title: ("Calendar"),
          activeColorPrimary: isBoy == null
              ? ColorManager.mainColor
              : (isBoy == true
                  ? ColorManager.boyColor
                  : ColorManager.girlBabyName),
          //   inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              ImagesPath.articelsIcon,
              color: isBoy == null
                  ? ColorManager.mainColor
                  : (isBoy == true
                      ? ColorManager.boyColor
                      : ColorManager.girlBabyName),
            ),
            title: ("Articles"),
            activeColorPrimary: isBoy == null
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyColor
                    : ColorManager.girlBabyName),
            inactiveIcon: SvgPicture.asset(ImagesPath.articelsIcon)),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            ImagesPath.moreIcon,
            color: isBoy == null
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyColor
                    : ColorManager.girlBabyName),
          ),
          inactiveIcon: SvgPicture.asset(ImagesPath.moreIcon),
          title: ("More"),
          activeColorPrimary: isBoy == null
              ? ColorManager.mainColor
              : (isBoy == true
                  ? ColorManager.boyColor
                  : ColorManager.girlBabyName),
          //   inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    PersistentTabController controller =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true, navBarHeight: SizeConfig.defultSize! * 6,
      backgroundColor: ColorManager.whiteColor,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
        colorBehindNavBar: ColorManager.whiteColor,

        // height: SizeConfig.defultSize! * 6,
        // decoration: BoxDecoration(
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
