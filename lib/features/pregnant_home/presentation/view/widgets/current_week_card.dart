import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/current_week_list_view.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/on_tab_current_week_card.dart';

class CurrentWeekCard extends StatefulWidget {
  const CurrentWeekCard({super.key, required this.pregnancyProfileModel});

  final PregnancyProfileModel pregnancyProfileModel;

  @override
  State<CurrentWeekCard> createState() => _CurrentWeekCardState();
}

class _CurrentWeekCardState extends State<CurrentWeekCard> {
  late int weekChanged;

  @override
  void initState() {
    super.initState();
    weekChanged = _calculateCurrentWeek();
  }

  int _calculateCurrentWeek() {
    return StringManager().calculatePregnancyDetails(widget
                .pregnancyProfileModel.user?.pregnant?.dueDate ??
            widget.pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ??
            widget.pregnancyProfileModel.user?.pregnant?.dateOfConception ??
            '' ??
            '')[1] ??
        5;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: OnTabCurrentWeekCard(
            pregnancyProfileModel: widget.pregnancyProfileModel,
          ),
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
            SizedBox(height: SizeConfig.defultSize! * 1.5),
            CurrentWeekListView(
              currentWeek: weekChanged,
              currentWeekChanged: (value) {
                setState(() {
                  weekChanged = value;
                });
              },
              selectedWeekColor: ColorManager.secondaryCalenderColor,
              arrowColor: ColorManager.secondaryCalenderColor,
              textColor: ColorManager.whiteColor,
            ),
            SizedBox(height: SizeConfig.defultSize! * .5),
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
