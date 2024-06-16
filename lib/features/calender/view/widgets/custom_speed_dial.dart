import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/calender/view/add_note_view.dart';
import 'package:app/features/calender/view/doctor_appointment_view.dart';
import 'package:app/features/calender/view/medication_view.dart';
import 'package:app/features/calender/view/mood_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomSpeedDial extends StatelessWidget {
  const CustomSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    BoxShadow boxShadow = const BoxShadow(
      color: ColorManager.shadowColor,
      blurRadius: 24,
      offset: Offset(0, 0),
      spreadRadius: 0,
    );
    return SpeedDial(
      activeIcon: Icons.clear,
      buttonSize:
          Size(SizeConfig.defaultSize! * 6.8, SizeConfig.defaultSize! * 6.8),
      visible: true,
      closeManually: false,
      renderOverlay: true,
      overlayColor: ColorManager.blurredBackgroundColor,
      overlayOpacity: .7,
      foregroundColor: Colors.white,
      elevation: 0,
      gradientBoxShape: BoxShape.circle,
      gradient: ColorManager.buttonColorGradient,
      children: [
        SpeedDialChild(
          label: "Mood",
          labelShadow: [boxShadow],
          labelStyle: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorManager.moodColor,
          ),
          labelBackgroundColor: ColorManager.secondaryMoodColor,
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const MoodView(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        SpeedDialChild(
          label: "Medication",
          labelShadow: [boxShadow],
          labelStyle: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorManager.medicationColor,
          ),
          labelBackgroundColor: ColorManager.secondaryMedicationColor,
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const MedicationView(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        SpeedDialChild(
          label: "Doctor appointment",
          labelShadow: [boxShadow],
          labelStyle: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorManager.doctorColor,
          ),
          labelBackgroundColor: ColorManager.secondaryDoctorColor,
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const DoctorAppointmentView(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        SpeedDialChild(
          label: "Note",
          labelShadow: [boxShadow],
          labelStyle: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorManager.noteColor,
          ),
          labelBackgroundColor: ColorManager.secondaryNoteColor,
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const AddNoteView(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
      ],
      child: Container(
        height: SizeConfig.defaultSize! * 6.8,
        width: SizeConfig.defaultSize! * 6.8,
        decoration: const BoxDecoration(
            gradient: ColorManager.buttonColorGradient, shape: BoxShape.circle),
        child: const Icon(Icons.add),
      ),
    );
  }
}
