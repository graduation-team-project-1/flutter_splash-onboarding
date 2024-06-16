import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  DateTime dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();

  Future<void> _date() async {
    var date = await showCalendarDatePicker2Dialog(
      useSafeArea: true,
      borderRadius: BorderRadius.circular(30),
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(325, 400),
      dialogBackgroundColor: const Color.fromARGB(255, 219, 205, 226),
    );
    if ((date?.isEmpty) == true || date == null) {
    } else {
      setState(() {
        dateTime = date[0] ?? dateTime;
        ConstantApp.weekValue = dateTime;
        print("this is week value for app ${ConstantApp.weekValue}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: const Text("Date"),
        labelStyle: Styles.textStyle24.copyWith(color: ColorManager.mainColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.mainColor,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.mainColor,
            width: 3,
          ),
        ),
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
