import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/edit_medication_view.dart';
import 'package:app/features/calender/view/edit_mood_view.dart';
import 'package:app/features/calender/view/edit_note_and_doctor_appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/calender/view/widgets/date_time_alarm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomEventItem extends StatelessWidget {
  const CustomEventItem({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
      child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            eventModel.delete();
            BlocProvider.of<EventsCubit>(context).fetchAllEvents();
          },
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: ColorManager.mainColor,
                  contentTextStyle:
                      const TextStyle(color: ColorManager.whiteColor),
                  titleTextStyle:
                      const TextStyle(color: ColorManager.whiteColor),
                  title: const Text("Are you sure?"),
                  content:
                      const Text("Do you want to delete the tour details?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: ColorManager.whiteColor,
                              width: 1.5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            child: Text(
                              "No ",
                              style: TextStyle(color: ColorManager.whiteColor),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: ColorManager.whiteColor,
                              width: 1.5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            child: Text(
                              "Yes",
                              style: TextStyle(color: ColorManager.whiteColor),
                            ),
                          )),
                    ),
                  ],
                );
              },
            );
          },
          background: Container(
              decoration: BoxDecoration(
                color: ColorManager.removeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SvgPicture.asset(ImagesPath.deleteIcon),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SvgPicture.asset(ImagesPath.deleteIcon),
                  ),
                ],
              )),
          child: eventModel.type != StringManager.kMood
              ? GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: eventModel.type == StringManager.kMedication
                          ? EditMedicationView(eventModel: eventModel)
                          : EditNoteAndDoctorAppointmentView(
                              eventModel: eventModel),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    height: SizeConfig.defaultSize! * 8,
                    decoration: BoxDecoration(
                      color: determineMainColor(eventModel.type),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.defaultSize! * .8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: determineSecondaryColor(eventModel.type),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSpace(1.5),
                                Text(
                                  eventModel.title,
                                  style: Styles.textStyle14.copyWith(
                                      fontFamily: FontType.kRoboto,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.timeColor),
                                ),
                                const VerticalSpace(.5),
                                DateTimeAlarm(
                                  formattedDate: eventModel.date,
                                  hasNotification: eventModel.isNotification,
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: EditMoodView(eventModel: eventModel),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    height: SizeConfig.defaultSize! * 10,
                    decoration: BoxDecoration(
                      color: determineMainColor(eventModel.type),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.defaultSize! * .8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: determineSecondaryColor(eventModel.type),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpace(2),
                              Row(
                                children: [
                                  const Spacer(),
                                  for (String report in eventModel.selectedMood)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.defaultSize! * .65),
                                      child: Container(
                                        height: SizeConfig.defaultSize! * 4,
                                        width: SizeConfig.defaultSize! * 8.2,
                                        decoration: BoxDecoration(
                                          color: ColorManager.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            report,
                                            style: Styles.textStyle12.copyWith(
                                              color: ColorManager.whiteColor,
                                              fontFamily: FontType.kRoboto,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const Spacer(flex: 1),
                                ],
                              ),
                              const VerticalSpace(1.5),
                              DateTimeAlarm(
                                formattedDate: eventModel.date,
                                hasNotification: eventModel.isNotification,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
