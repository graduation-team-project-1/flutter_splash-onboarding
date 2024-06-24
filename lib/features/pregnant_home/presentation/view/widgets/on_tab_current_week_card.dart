import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_slider.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_trimester_table.dart';
import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnTabCurrentWeekCard extends StatelessWidget {
  const OnTabCurrentWeekCard({super.key, required this.pregnancyProfileModel});
  final PregnancyProfileModel pregnancyProfileModel;

  int calculateCurrentWeek() {
    return StringManager().calculatePregnancyDetails(
            pregnancyProfileModel.user?.pregnant?.dueDate ??
                pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ??
                pregnancyProfileModel.user?.pregnant?.dateOfConception ??
                '')[1] ??
        5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          StringManager.gestationalAge,
          style: Styles.textStyle18.copyWith(
            color: ColorManager.colorBody,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.cancel_outlined,
              size: SizeConfig.defultSize! * 3.5,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${StringManager().calculateGestationalAge(pregnancyProfileModel.user?.pregnant?.dueDate ?? pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ?? pregnancyProfileModel.user?.pregnant?.dateOfConception ?? '')[0]} weeks and ${StringManager().calculateGestationalAge(pregnancyProfileModel.user?.pregnant?.dueDate ?? pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ?? pregnancyProfileModel.user?.pregnant?.dateOfConception ?? '')[1]} days",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 22,
                    color: ColorManager.darkPink,
                  ),
                ),
              ),
              VerticalSpace(SizeConfig.defultSize! * .3),
              CustomSlider(
                val: calculateCurrentWeek().toDouble(),
              ),
              VerticalSpace(SizeConfig.defultSize! * .1),
              Text(
                StringManager().getCompletionMessage(calculateCurrentWeek()),
                style: Styles.textStyle12.copyWith(
                  color: ColorManager.darkPink,
                ),
              ),
              VerticalSpace(SizeConfig.defultSize! * .3),
              CustomTrimesterTable(
                currentWeek: calculateCurrentWeek(),
              ),
              VerticalSpace(SizeConfig.defultSize! * .2),
              Text(
                StringManager.dueDate,
                style: Styles.textStyle16.copyWith(
                  color: ColorManager.darkPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSpace(SizeConfig.defultSize! * .03),
              Text(
                StringManager().formatDueDate(pregnancyProfileModel
                        .user?.pregnant?.dueDate ??
                    pregnancyProfileModel
                        .user?.pregnant?.firstDayOfLastPeriod ??
                    pregnancyProfileModel.user?.pregnant?.dateOfConception ??
                    ''),
                style: Styles.robotoTextStyle12.copyWith(
                  color: ColorManager.textInfoColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
