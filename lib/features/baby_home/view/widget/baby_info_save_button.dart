import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';

class SaveButtton extends StatelessWidget {
  const SaveButtton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: ColorManager.moodColor),
        child: Text(
          "Save",
          style:
              Styles.robotoTextStyle16.copyWith(color: ColorManager.whiteColor),
        ),
        onPressed: () {
          // Get.to(BabyHomeView());
        },
      ),
    );
  }
}
