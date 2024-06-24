import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/current_week_list_view.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/on_tab_current_week_card.dart';

class ExerciseCurrentTrimester extends StatefulWidget {
  const ExerciseCurrentTrimester(
      {super.key, required this.pregnancyProfileModel});

  final PregnancyProfileModel pregnancyProfileModel;

  @override
  State<ExerciseCurrentTrimester> createState() =>
      _ExerciseCurrentTrimesterState();
}

class _ExerciseCurrentTrimesterState extends State<ExerciseCurrentTrimester> {
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
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              _buildTrimesterContainer("1ST TRIMESTER", weekChanged),
              const Spacer(),
              _buildTrimesterContainer("2ND TRIMESTER", weekChanged),
              const Spacer(),
              _buildTrimesterContainer("3RD TRIMESTER", weekChanged),
              const Spacer(),
            ],
          ),
          Text(
            "Week",
            style: Styles.robotoTextStyle12.copyWith(
              color: ColorManager.mainColor,
            ),
          ),
          CurrentWeekListView(
            currentWeek: weekChanged,
            currentWeekChanged: (value) {
              setState(() {
                weekChanged = value;
              });
            },
            selectedWeekColor: ColorManager.selectedWeekColor,
            arrowColor: ColorManager.mainColor,
            textColor: ColorManager.mainColor,
          ),
        ],
      ),
    );
  }

  Widget _buildTrimesterContainer(String trimesterText, int weekChanged) {
    bool isCurrentTrimester =
        trimesterText == StringManager().getCurrentTrimester(weekChanged);

    return Container(
      height: 30,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isCurrentTrimester
            ? ColorManager.whiteColor
            : ColorManager.mainColor,
        border: Border.all(color: ColorManager.mainColor),
      ),
      child: Center(
        child: Text(
          trimesterText,
          style: Styles.robotoTextStyle12.copyWith(
            fontFamily: FontType.kRoboto,
            color: isCurrentTrimester
                ? ColorManager.mainColor
                : ColorManager.whiteColor,
          ),
        ),
      ),
    );
  }
}
