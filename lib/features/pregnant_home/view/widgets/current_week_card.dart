import 'package:app/core/resource/font_manager.dart';
import 'package:app/features/pregnant_home/view/widgets/current_week_list_view.dart';
import 'package:app/features/pregnant_home/view/widgets/on_tab_current_week_card.dart';
import 'package:flutter/material.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CurrentWeekCard extends StatefulWidget {
  const CurrentWeekCard({Key? key, required this.currentWeek})
      : super(key: key);

  final int currentWeek;

  @override
  State<CurrentWeekCard> createState() => _CurrentWeekCardState();
}

class _CurrentWeekCardState extends State<CurrentWeekCard> {
  late int weekChanged;
  @override
  void initState() {
    super.initState();
    weekChanged = widget.currentWeek;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const OnTabCurrentWeekCard(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManager.mainColor,
        ),
        height: SizeConfig.defultSize! * 10,
        child: Column(
          children: [
            CurrentWeekListView(
              currentWeek: widget.currentWeek,
              currentWeekChanged: (value) {
                setState(() {
                  weekChanged = value;
                });
              },
              selectedWeekColor: ColorManager.secondaryCalenderColor,
              arrowColor: ColorManager.secondaryCalenderColor,
              textColor: ColorManager.whiteColor,
            ),
            Text(
              StringManager().getCurrentTrimester(weekChanged),
              style: Styles.textStyle16.copyWith(
                fontFamily: FontType.kRoboto,
                color: ColorManager.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
