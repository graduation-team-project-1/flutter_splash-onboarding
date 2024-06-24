import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/user%20data/view/widgets/custom_date_picker.dart';
import 'package:app/features/auth/user%20data/view/widgets/date_screen_continue_button.dart';
import 'package:flutter/material.dart';

class ChooseTheDate extends StatelessWidget {
  final String _dateRole;
  const ChooseTheDate(this._dateRole, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Text(
                  _dateRole,
                  style: Styles.textStyle24.copyWith(
                    color: ColorManager.mainColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const PickDate()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: DateContinueButton(),
          ),
        ],
      ),
    );
  }
}
