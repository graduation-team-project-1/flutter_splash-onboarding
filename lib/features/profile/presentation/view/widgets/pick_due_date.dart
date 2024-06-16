import 'package:flutter/material.dart';
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PickDueDate extends StatefulWidget {
  const PickDueDate(
      {Key? key, required this.onDateSelected, required this.initialValue})
      : super(key: key);

  final void Function(DateTime) onDateSelected;
  final String initialValue;

  @override
  State<PickDueDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDueDate> {
  DateTime dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue;
    dateTime = DateFormat('yyyy-MM-dd').parse(widget.initialValue);
  }

  Future<void> _date() async {
    var date = await showCalendarDatePicker2Dialog(
      useSafeArea: true,
      borderRadius: BorderRadius.circular(30),
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(325, 400),
      dialogBackgroundColor: ColorManager.pickDateColor,
    );
    if ((date?.isEmpty) == true || date == null) {
    } else {
      setState(() {
        dateTime = date[0] ?? dateTime;
        controller.text = DateFormat('dd-MM-yyyy').format(dateTime);
        widget.onDateSelected(dateTime);
      });
    }
  }

//  @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         bool _validateDueDate(DateTime date) {
//           return date.isBefore(DateTime.now()) ||
//               date.isAtSameMomentAs(DateTime.now());
//         }

//         DateTime selectedDate = DateTime.parse(value!);
//         if (value?.isEmpty ?? true) {
//           return "${StringManager.dueDate} is required";
//         } else if (_validateDueDate(selectedDate)) {
//           return null;
//         } else {
//           return "Due date cannot be in the future."; // Date is in the future
//         }
//       },


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "${StringManager.dueDate} is required";
        } else {
          return null;
        }
      },
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: const Text(StringManager.dueDate),
        labelStyle: Styles.textStyle14.copyWith(
            color: ColorManager.barColor, fontFamily: FontType.kRoboto),
        hintStyle: Styles.textStyle16.copyWith(
            color: ColorManager.barColor, fontFamily: FontType.kRoboto),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.mainColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.mainColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.mainColor,
            width: 1,
          ),
        ),
        hintText: "Pick a date",
        suffixIcon: IconButton(
          onPressed: _date,
          icon: SvgPicture.asset(ImagesPath.calender),
        ),
      ),
    );
  }
}