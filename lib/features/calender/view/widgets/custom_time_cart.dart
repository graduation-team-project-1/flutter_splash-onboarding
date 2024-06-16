import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/calender/view/widgets/date_time_alarm.dart';
import 'package:app/features/profile/presentation/view/widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CustomDateAndTimeCart extends StatefulWidget {
  const CustomDateAndTimeCart({
    Key? key,
    required this.onTap,
    required this.selectedDateAndTime,
    required this.onCheckedChanged,
    required this.checked,
  }) : super(key: key);

  final VoidCallback onTap;
  final DateTime selectedDateAndTime;
  final ValueSetter<bool> onCheckedChanged;
  final bool checked;

  @override
  State<CustomDateAndTimeCart> createState() => _CustomDateAndTimeCartState();
}

class _CustomDateAndTimeCartState extends State<CustomDateAndTimeCart> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    // Format the selectedDateAndTime using DateFormat
    String formattedDate = DateFormat('EEE dd MMM yyyy - hh:mm a')
        .format(widget.selectedDateAndTime);
    return ListTile(
      onTap: widget.onTap,
      tileColor: ColorManager.textFormFieldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      leading: SvgPicture.asset(
        ImagesPath.timeAndReminderIcon,
      ),
      trailing: CustomSwitch(
        value: checked,
        onChanged: (value) {
          setState(() {
            checked = value;
            widget.onCheckedChanged(checked);
          });
        },
      ),
      title: Text(
        StringManager.dateTimeReminder,
        style: Styles.textStyle14.copyWith(
          fontFamily: FontType.kRoboto,
          fontWeight: FontWeight.w800,
          color: ColorManager.timeColor,
        ),
      ),
      subtitle: DateTimeAlarm(
        formattedDate: formattedDate,
        hasNotification: checked,
      ),
    );
  }
}
