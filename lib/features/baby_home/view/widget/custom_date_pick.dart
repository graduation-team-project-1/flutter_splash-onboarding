import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BabyInfoCustomPickDate extends StatefulWidget {
  const BabyInfoCustomPickDate({super.key});

  @override
  State<BabyInfoCustomPickDate> createState() => _BabyInfoCustomPickDateState();
}

class _BabyInfoCustomPickDateState extends State<BabyInfoCustomPickDate> {
  DateTime dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();

  Future<void> _date() async {
    var date = await showCalendarDatePicker2Dialog(
        useSafeArea: true,
        borderRadius: BorderRadius.circular(30),
        context: context,
        config: CalendarDatePicker2WithActionButtonsConfig(),
        dialogSize: const Size(325, 400),
        dialogBackgroundColor: ColorManager.babyCheckColor);
    if ((date?.isEmpty) == true || date == null) {
    } else {
      setState(() {
        dateTime = date[0] ?? dateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            borderSide: BorderSide(color: ColorManager.moodColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: ColorManager.moodColor)),
        hintText: dateTime.toString().split(" ")[0],
        suffixIcon: IconButton(
            onPressed: () {
              _date();
            },
            icon: SvgPicture.asset(ImagesPath.calender)),
      ),
    );
  }
}
