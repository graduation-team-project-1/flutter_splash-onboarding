import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationUtils {
  static void navigateToScreen(
    BuildContext context,
    Widget screen,
    bool withNavBar,
  ) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
      pageTransitionAnimation: PageTransitionAnimation.sizeUp,
    );
  }
}
