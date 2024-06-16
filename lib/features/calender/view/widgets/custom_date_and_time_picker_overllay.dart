import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_date_and_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomDatePickerOverlay extends StatelessWidget {
  const CustomDatePickerOverlay({
    required this.handleBackgroundTap,
    required this.handleDateTimeChanged,
    super.key,
  });
  final Function handleBackgroundTap;
  final Function(DateTime?) handleDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.textFormFieldColor.withOpacity(.2),
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const VerticalSpace(5),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Row(
                      children: [
                        const Spacer(flex: 1),
                        GestureDetector(
                          onTap: () {
                            handleBackgroundTap();
                          },
                          child: SvgPicture.asset(ImagesPath.doneIcon),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: CustomDateAndTimePicker(
                    onDateTimeChanged: handleDateTimeChanged,
                  ),
                ))
              ],
            )));
  }
}
