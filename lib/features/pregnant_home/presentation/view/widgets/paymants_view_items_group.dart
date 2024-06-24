import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view_item.dart';
import 'package:flutter/material.dart';

class PaymantsViewItemsGroup extends StatelessWidget {
  const PaymantsViewItemsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        const PaymantsViewItem(
            duration: StringManager.oneMonth,
            price: StringManager.oneMonthPrice),
        const Spacer(),
        Column(
          children: [
            Container(
                height: SizeConfig.defultSize! * 19,
                width: SizeConfig.screenWidth! / 3.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: ColorManager.primaryColorGradient),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      StringManager.popular,
                      style: Styles.textStyle16.copyWith(
                          fontFamily: FontType.kRoboto,
                          color: ColorManager.whiteColor),
                    ),
                    const Spacer(),
                    const PaymantsViewItem(
                        duration: StringManager.wholePregnancy,
                        price: StringManager.wholePregnancyPrice),
                  ],
                )),
            const VerticalSpace(3)
          ],
        ),
        const Spacer(),
        const PaymantsViewItem(
            duration: StringManager.threeMonth,
            price: StringManager.threeMonthPrice),
        const Spacer(),
      ],
    );
  }
}
