import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:flutter/cupertino.dart';

class CustomDateAndTimePicker extends StatefulWidget {
  final Function(DateTime) onDateTimeChanged;

  const CustomDateAndTimePicker({super.key, required this.onDateTimeChanged});

  @override
  State<CustomDateAndTimePicker> createState() =>
      _CustomDateAndTimePickerState();
}

class _CustomDateAndTimePickerState extends State<CustomDateAndTimePicker> {
  DateTime? selectedDateAndTime;

  @override
  void initState() {
    super.initState();
    selectedDateAndTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: ColorManager.shadowColor,
            blurRadius: 24,
            offset: Offset(0, 0),
            spreadRadius: 5,
          ),
        ],
      ),
      width: SizeConfig.defultSize! * 33,
      height: SizeConfig.defultSize! * 22,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CupertinoDatePicker(
          backgroundColor: ColorManager.whiteColor,
          minimumDate: DateTime.now().subtract(const Duration(minutes: 1)),
          initialDateTime: selectedDateAndTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (value) {
            setState(() {
              selectedDateAndTime = value;
            });
            widget.onDateTimeChanged(value);
          },
        ),
      ),
    );
  }
}
