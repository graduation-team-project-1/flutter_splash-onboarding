import 'package:app/core/resource/string_manage.dart';
import 'package:flutter/material.dart';

class ColorManager {
  static const Color mainColor = Color(0xffb99ac8);
  static const LinearGradient primaryColorGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xff79A8F0),
      Color(0xffB99AC8),
      Color(0xffF4ACC4),
    ],
  );
  static const LinearGradient buttonColorGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFFB99AC8),
      Color(0xFFEEA4CE),
    ],
  );
  static const LinearGradient boxColorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF7F0F6),
      Color(0xFFF3EFF7),
      Color(0xFFEFF0F9),
      Color(0xFFECF1FB),
      Color(0xFFEAF1FC),
      Color(0xFFEAF1FC),
      Color(0xFFEAF1FC),
      Color(0xFFEAF1FC),
    ],
  );
  static const Color whiteColor = Colors.white;
  static const Color calenderRangeColor = Color(0xFFF2DEF1);
  static const Color girlColor = Color(0xffF4ACC4);
  
  static const Color inpuDecorationColor = Color(0xff6750A4);
  static const Color moodColor = Color(0xFF7469B1);
  static const Color secondaryMoodColor = Color(0xFFF1EEFF);
  static const Color medicationColor = Color(0xFF77B169);
  static const Color secondaryMedicationColor = Color(0xFFE6F6E2);
  static const Color noteColor = Color(0xFFCC4318);
  static const Color secondaryNoteColor = Color(0xFFFFEAE4);
  static const Color doctorColor = Color(0xFF52A8D9);
  static const Color secondaryDoctorColor = Color(0xFFE5F6FF);
  static const Color boyColor = Color(0xff79A8F0);
  static const Color colorBody = Color(0xff262626);
  static const Color newsColor = Color(0xFF2B2B2B);
  static const Color blackColor = Color(0xff1E1E1E);
  static const Color shadowColor = Color(0x28000000);
  static const Color barColor = Color(0xff979797);
  static const Color grayColor = Color(0xffBDBDBD);
  static const Color pinkColor = Color(0xff977AA5);
  static const Color seconderPinkColor = Color.fromARGB(30, 185, 154, 200);
  static const Color calenderColor = Color.fromRGBO(214, 199, 221, 1);
  static const Color redColor = Colors.red;
  static const Color lightPink = Color(0xFFE0479E);

  static const Color blurredBackgroundColor = Color(0xFFEFE1EA);
  static const Color textFormFieldColor = Color(0xFFEFE4EE);
  static const Color timeColor = Color(0xFF12151F);
  static const Color dateColor = Color(0xFF71727D);
  static const Color switchIconColor = Color(0xFFB5B4B5);
  static const Color removeColor = Color(0xFFFF5959);
  static const Color secondaryCalenderColor = Color(0xFFF9B9D1);
  static const Color babyInfoColor = Color(0xFF9777A6);
  static const Color babyCheckColor = Color(0xffF5F0F7);
  static const Color firstTrimesterTableColor = Color(0xffE6E0EE);
  static const Color secondTrimesterTableColor = Color(0xffEEE0E9);
  static const Color thirdTrimesterTableColor = Color(0xffEEE0E0);
  static const Color selectedWeekColor = Color(0xFFFFDEDE);
  static const Color textInfoColor = Color(0xFF535353);
  static const Color likeMainColor = Color(0xFF977AA5);
  static const Color likeGirlColor = Color(0xFFE5A7C5);
  static const Color profileBackgroundColor = Color(0xFFF4EFF8);
  static const Color secondaryBarColor = Color(0xFFEDEDED);
  static const Color ratedStarColor = Color(0xFFFFC978);
  static const Color unratedStarColor = Color(0xFFD9D9D9);
  static const Color darkPink = Color(0xFF78556E);
  static const Color pickDateColor = Color(0xFFD5C7DC);

  static const Color moreBackgroundColor = Color.fromRGBO(185, 154, 200, 0.15);
}

Color determineMainColor(String type) {
  switch (type) {
    case StringManager.kDoctorAppointment:
      return ColorManager.doctorColor;
    case StringManager.kMedication:
      return ColorManager.medicationColor;
    case StringManager.kMood:
      return ColorManager.moodColor;
    case StringManager.kNote:
      return ColorManager.noteColor;
    default:
      return ColorManager.mainColor;
  }
}

Color determineSecondaryColor(String type) {
  switch (type) {
    case StringManager.kDoctorAppointment:
      return ColorManager.secondaryDoctorColor;
    case StringManager.kMedication:
      return ColorManager.secondaryMedicationColor;
    case StringManager.kMood:
      return ColorManager.secondaryMoodColor;
    case StringManager.kNote:
      return ColorManager.secondaryNoteColor;
    default:
      return ColorManager.calenderRangeColor;
  }
}

List<BoxShadow> getCardBoxShadow(
    {required double blurRadius, required double spreadRadius}) {
  return [
    BoxShadow(
      color: ColorManager.shadowColor,
      blurRadius: blurRadius,
      offset: const Offset(0, 0),
      spreadRadius: spreadRadius,
    ),
  ];
}
