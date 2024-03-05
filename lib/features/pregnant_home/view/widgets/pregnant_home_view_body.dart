import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/features/calender/view/calender_view.dart';
import 'package:app/features/pregnant_home/view/widgets/pregnant_home_view_body_content.dart';
import 'package:app/test/article_view.dart';
import 'package:app/test/more_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PregnantHomeViewBody extends StatelessWidget {
  const PregnantHomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const PregnantHomeViewBodyContent(),
        const CalenderView(),
        const ArticleView(),
        const MoreView(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImagesPath.homeIcon,
              color: ColorManager.mainColor),
          inactiveIcon: SvgPicture.asset(ImagesPath.homeIcon),
          title: ("Home"),
          activeColorPrimary: ColorManager.mainColor,
          //   inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImagesPath.calenderIcon,
              color: ColorManager.mainColor),
          inactiveIcon: SvgPicture.asset(ImagesPath.calenderIcon),
          title: ("Calendar"),
          activeColorPrimary: ColorManager.mainColor,
          //   inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
            icon: SvgPicture.asset(ImagesPath.articelsIcon,
                color: ColorManager.mainColor),
            title: ("Articles"),
            activeColorPrimary: ColorManager.mainColor,
            inactiveIcon: SvgPicture.asset(ImagesPath.articelsIcon)),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImagesPath.moreIcon,
              color: ColorManager.mainColor),
          inactiveIcon: SvgPicture.asset(ImagesPath.moreIcon),
          title: ("More"),
          activeColorPrimary: ColorManager.mainColor,
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

// import 'package:app/core/resource/assets.dart';
// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/core/resource/size_config.dart';
// import 'package:app/core/resource/styles.dart';
// import 'package:app/features/calender/view/calender_view.dart';
// import 'package:app/test/article_view.dart';
// import 'package:app/test/more_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class PregnantHomeViewBody extends StatefulWidget {
//   const PregnantHomeViewBody({Key? key}) : super(key: key);

//   @override
//   State<PregnantHomeViewBody> createState() => _PregnantHomeViewBodyState();
// }

// class _PregnantHomeViewBodyState extends State<PregnantHomeViewBody> {
//   int currentIndex = 0;
//   final List<Widget> pages = [
//     Container(
//       color: Colors.blue,
//       child: const Center(
//         child: Text("Home Page"),
//       ),
//     ),
//     const CalenderView(),
//     const ArticleView(),
//     const MoreView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           pages[currentIndex],
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: SizeConfig.defultSize! * 6,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 20,
//                     offset: const Offset(0, -1),
//                   ),
//                 ],
//               ),
//               child: BottomNavigationBar(
//                 type: BottomNavigationBarType.fixed,
//                 backgroundColor: ColorManager.whiteColor,
//                 showSelectedLabels: true,
//                 showUnselectedLabels: true,
//                 unselectedItemColor: ColorManager.barColor,
//                 selectedItemColor: ColorManager.mainColor,
//                 currentIndex: currentIndex,
//                 selectedLabelStyle: Styles.textStyle10,
//                 unselectedLabelStyle: Styles.textStyle10,
//                 onTap: (index) {
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(ImagesPath.homeIcon),
//                     activeIcon: SvgPicture.asset(ImagesPath.homeIcon,
//                         color: ColorManager.mainColor),
//                     label: "Home",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(ImagesPath.calenderIcon),
//                     activeIcon: SvgPicture.asset(ImagesPath.calenderIcon,
//                         color: ColorManager.mainColor),
//                     label: "Calendar",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(ImagesPath.articelsIcon),
//                     activeIcon: SvgPicture.asset(ImagesPath.articelsIcon,
//                         color: ColorManager.mainColor),
//                     label: "Articles",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(ImagesPath.moreIcon),
//                     activeIcon: SvgPicture.asset(ImagesPath.moreIcon,
//                         color: ColorManager.mainColor),
//                     label: "More",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



//////////////
///// import 'package:app/core/resource/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:app/core/resource/assets.dart';
// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/core/resource/styles.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         height: SizeConfig.defultSize! * 6,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 20,
//               offset: const Offset(0, -1),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: ColorManager.whiteColor,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           unselectedItemColor: ColorManager.barColor,
//           selectedItemColor: ColorManager.mainColor,
//           currentIndex: widget.currentIndex,
//           selectedLabelStyle: Styles.textStyle10,
//           unselectedLabelStyle: Styles.textStyle10,
//           onTap: widget.onTap,
//           items: [
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(ImagesPath.homeIcon),
//               activeIcon: SvgPicture.asset(
//                 ImagesPath.homeIcon,
//                 color: ColorManager.mainColor,
//               ),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(ImagesPath.calenderIcon),
//               activeIcon: SvgPicture.asset(
//                 ImagesPath.calenderIcon,
//                 color: ColorManager.mainColor,
//               ),
//               label: "Calendar",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(ImagesPath.articelsIcon),
//               activeIcon: SvgPicture.asset(
//                 ImagesPath.articelsIcon,
//                 color: ColorManager.mainColor,
//               ),
//               label: "Articles",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(ImagesPath.moreIcon),
//               activeIcon: SvgPicture.asset(
//                 ImagesPath.moreIcon,
//                 color: ColorManager.mainColor,
//               ),
//               label: "More",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
