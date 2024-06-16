// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:app/core/resource/assets.dart';
// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/core/resource/size_config.dart';
// import 'package:app/features/baby_home/view/widget/home/baby_daies_counter.dart';
// import 'package:app/features/baby_home/view/widget/home/home_alert.dart';
// import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
// import 'package:app/features/calender/models/event_model.dart';
// import 'package:app/features/calender/view/calender_view.dart';
// import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
// import 'package:app/features/main/article/presentation/view/articles_screen.dart';
// import 'package:app/features/main/more/presentation/view/more_view.dart';
// import 'package:app/features/profile/view/profile_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class BottomNavigationHomeView extends StatelessWidget {
//   BottomNavigationHomeView({required this.isBoy});
//   final bool isBoy;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EventsCubit(),
//       child: BottomNavigationHomeViewBody(
//         isBoy: isBoy,
//       ),
//     );
//   }
// }

// class BottomNavigationHomeViewBody extends StatelessWidget {
//   const BottomNavigationHomeViewBody({required this.isBoy});
//   final bool isBoy;
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _pagies = [
//       BabyHomeView(isBoy: isBoy),
//       const CalenderView(),
//       const ArticlesScreen(),
//       const MoreView(),
//     ];

//     List<PersistentBottomNavBarItem> navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: SvgPicture.asset(
//             ImagesPath.homeIcon,
//             color: isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           ),
//           inactiveIcon: SvgPicture.asset(ImagesPath.homeIcon),
//           title: ("Home"),
//           activeColorPrimary:
//               isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           //   inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: SvgPicture.asset(
//             ImagesPath.calenderIcon,
//             color:  isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           ),
//           inactiveIcon: SvgPicture.asset(ImagesPath.calenderIcon),
//           title: ("Calendar"),
//           activeColorPrimary:  isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           //   inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: SvgPicture.asset(
//             ImagesPath.articelsIcon,
//             color: isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           ),
//           title: ("Articles"),
//           activeColorPrimary:
//                isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           inactiveIcon: SvgPicture.asset(ImagesPath.articelsIcon),
//         ),
//         PersistentBottomNavBarItem(
//           icon: SvgPicture.asset(
//             ImagesPath.moreIcon,
//             color:  isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           ),
//           inactiveIcon: SvgPicture.asset(ImagesPath.moreIcon),
//           title: ("More"),
//           activeColorPrimary:
//                isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
//           //   inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//       ];
//     }

//     PersistentTabController controller =
//         PersistentTabController(initialIndex: 0);

//     return PersistentTabView(
//       context,
//       controller: controller,
//       screens: _pagies,
//       items: navBarsItems(),
//       confineInSafeArea: true, navBarHeight: SizeConfig.defultSize! * 6,
//       backgroundColor: ColorManager.whiteColor,
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 20,
//             offset: const Offset(0, -1),
//           ),
//         ],
//         colorBehindNavBar: ColorManager.whiteColor,

//         // height: SizeConfig.defultSize! * 6,
//         // decoration: BoxDecoration(
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style1, // Choose the nav bar style with this property.
//     );
//   }
// }

// class BabyHomeView extends StatelessWidget {
//   const BabyHomeView({
//     required this.isBoy,
//   });
//   final bool isBoy;

//   bool hasNotification(List<EventModel> events) {
//     for (EventModel event in events) {
//       if (event.isNotification) {
//         return true;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<EventModel> events =
//         BlocProvider.of<EventsCubit>(context).events ?? [];

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: SizeConfig.defultSize! * 10,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: CustomHomeAppBar(
//           onImageTap: () {
//             PersistentNavBarNavigator.pushNewScreen(
//               context,
//               screen: const ProfileView(),
//               withNavBar: false,
//               pageTransitionAnimation: PageTransitionAnimation.sizeUp,
//             );
//           },
//           title: "Hi, Shifaa",
//           subTitle: "Good Morning",
//           imagePath:
//               "https://i.pinimg.com/originals/f3/8d/bc/f38dbcbab1e30643e05f5b9caa8aaa39.jpg",
//           hasNotifcation: hasNotification(events),
//           onTap: () {
//             PersistentNavBarNavigator.pushNewScreen(
//               context,
//               screen: const CalenderView(),
//               withNavBar: true,
//               pageTransitionAnimation: PageTransitionAnimation.sizeUp,
//             );
//           },
//         ),
//       ),
//       body: BabyHomeViewBody(
//         isBoy: isBoy,
//       ),
//     );
//   }
// }

// class BabyHomeViewBody extends StatelessWidget {
//   const BabyHomeViewBody({super.key, required this.isBoy});
//   final bool isBoy;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0, right: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             BabyDaiesCounter(
//               isBoy: isBoy,
//             ),
//             HomeChangeModeCard(
//               isBoy: isBoy,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NextScreenTest extends StatelessWidget {
//   const NextScreenTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Next Screen"),
//       ),
//     );
//   }
// }
