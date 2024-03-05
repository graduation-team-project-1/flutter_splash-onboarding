import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/view/widgets/current_week_list_view.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';

class BabyCardInfoView extends StatefulWidget {
  const BabyCardInfoView({super.key, required this.currentWeek});
  final int currentWeek;
  @override
  State<BabyCardInfoView> createState() => _BabyCardInfoViewState();
}

class _BabyCardInfoViewState extends State<BabyCardInfoView> {
  late int weekChanged;
  @override
  void initState() {
    super.initState();
    weekChanged = widget.currentWeek;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: CustomAppBar(
          title: "Week $weekChanged",
          textColor: ColorManager.blackColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentWeekListView(
                selectedWeekColor: ColorManager.selectedWeekColor,
                currentWeek: widget.currentWeek,
                arrowColor: ColorManager.mainColor,
                textColor: ColorManager.mainColor,
                currentWeekChanged: (value) {
                  setState(() {
                    weekChanged = value;
                  });
                },
              ),
              const VerticalSpace(2),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomImageDisplay(
                      imageUrl:
                          "https://babyjoyjoy.com/wp-content/uploads/2023/04/Week-39-Pregnancy.png",
                      height: 40 * SizeConfig.defultSize!,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: Text(
                        "Week $weekChanged",
                        style: Styles.textStyle24
                            .copyWith(color: ColorManager.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(2),
              Text(
                "At this point",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.blackColor),
              ),
              const VerticalSpace(.5),
              Text(
                  "- Your baby is the size of a big cabbage\n- Heart rate: 145-165 BPM\n- Weight: 1.32kg\n- Height: 39,9cm\n- hCG: 2700-78100 mIU/ml",
                  style: Styles.textStyle16.copyWith(
                    color: ColorManager.textInfoColor,
                    fontFamily: FontType.kRoboto,
                    fontWeight: FontWeight.w400,
                  )),
              const VerticalSpace(1),
              Text(
                "Your Baby's Development",
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.blackColor),
              ),
              const VerticalSpace(.5),
              Text(
                "Now weighing about 3 pounds (1,400 grams) and measuring about 10.8 inches (27 cm) Watch Your Baby Grow from crown to rump. your baby continues to gain weight and add layers of fat. This fat makes the baby look less wrinkly and will help provide warmth after birth.",
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontType.kRoboto,
                  color: ColorManager.textInfoColor,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
