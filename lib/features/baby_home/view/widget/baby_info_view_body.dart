import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/baby_home/view/widget/baby_info_save_button.dart';
import 'package:app/features/baby_home/view/widget/custom_date_pick.dart';
import 'package:app/features/baby_home/view/widget/custome_text_baby_info.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BabyInformationViewBody extends StatefulWidget {
  const BabyInformationViewBody({super.key});

  @override
  State<BabyInformationViewBody> createState() =>
      _BabyInformationViewBodyState();
}

class _BabyInformationViewBodyState extends State<BabyInformationViewBody> {
  final TextEditingController controller = TextEditingController();
  String droupDownValue = "Boy";
  @override
  void dispose() {
    controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeTextBabyInfo(title: "Baby Name"),
          Padding(
            padding: EdgeInsets.all(4),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorManager.moodColor),
                ),
                hintText: "Baby Name",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorManager.moodColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          CustomeTextBabyInfo(title: "Gender"),
          Padding(
            padding: EdgeInsets.all(4),
            child: DropdownButtonFormField2(
              value: droupDownValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorManager.moodColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorManager.moodColor),
                ),
              ),
              items: [
                DropdownMenuItem(
                  child: Text("Boy"),
                  value: "Boy",
                ),
                DropdownMenuItem(
                  child: Text("Girl"),
                  value: "Girl",
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  droupDownValue = newValue ?? droupDownValue;
                });
              },
            ),
          ),
          CustomeTextBabyInfo(title: "Date of Birth"),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: BabyInfoCustomPickDate(),
          ),
          Spacer(),
          SaveButtton(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 32,
          )
        ],
      ),
    );
  }
}
