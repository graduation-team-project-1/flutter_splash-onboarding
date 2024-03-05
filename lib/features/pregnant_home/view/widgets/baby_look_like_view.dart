import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/view/widgets/current_week_list_view.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_image_display.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class BabyLookLikeView extends StatefulWidget {
  const BabyLookLikeView({super.key, required this.currentWeek});
  final int currentWeek;
  @override
  State<BabyLookLikeView> createState() => _BabyLookLikeViewState();
}

class _BabyLookLikeViewState extends State<BabyLookLikeView> {
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
        title: CustomAppBar(
          title: "Week $weekChanged",
          textColor: ColorManager.blackColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Container(
              width: double.infinity,
              height: 35 * SizeConfig.defultSize!,
              decoration: ShapeDecoration(
                color: ColorManager.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(5 * SizeConfig.defultSize!),
                child: SimpleShadow(
                    opacity: 1,
                    color: ColorManager.shadowColor,
                    offset: const Offset(0, 10),
                    sigma: 15,
                    child: Center(
                      child: CustomImageDisplay(
                          imageUrl:
                              "https://pngimg.com/uploads/tomato/tomato_PNG12592.png",
                          height: 22 * SizeConfig.defultSize!,
                          width: double.infinity,
                          fit: BoxFit.contain),
                    )),
              ),
            ),
            const VerticalSpace(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                StringManager.mybabyislike,
                style: Styles.textStyle18.copyWith(
                  color: ColorManager.textInfoColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "Eggplant",
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorManager.blackColor,
                  fontFamily: FontType.kRoboto,
                ),
              ),
            ),
            const CustomListTile(
                title: "Weight",
                subTitle: "1500 g",
                image: ImagesPath.weightIcon),
            const CustomListTile(
                title: "Height",
                subTitle: "41.1 cm (from crown to toe)",
                image: ImagesPath.lengthIcon),
            const CustomListTile(
                title: "Heart rate",
                subTitle: "1500 g",
                image: ImagesPath.heartRateIcon),
            const CustomListTile(
                title: "hCG norms",
                subTitle: "41.1 cm (from crown to toe)",
                image: ImagesPath.lightLabResearcIcon),
            const VerticalSpace(2),
          ]),
        ),
      ),
    );
  }
}
