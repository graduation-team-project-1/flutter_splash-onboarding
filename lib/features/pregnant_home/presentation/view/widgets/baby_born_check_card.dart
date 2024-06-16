// import 'package:app/core/resource/assets.dart';
// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/core/resource/size_config.dart';
// import 'package:app/core/resource/string_manage.dart';
// import 'package:app/core/resource/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class BabyBornCheckedCard extends StatefulWidget {
//   const BabyBornCheckedCard({super.key});
//   @override
//   State<BabyBornCheckedCard> createState() => _BabyBornCheckedCardState();
// }

// class _BabyBornCheckedCardState extends State<BabyBornCheckedCard> {
//   bool isSwitchOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 9 * SizeConfig.defultSize!,
//       decoration: ShapeDecoration(
//         color: ColorManager.babyCheckColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         shadows: getCardBoxShadow(),
//       ),
//       child: Center(
//         child: ListTile(
//           leading: SvgPicture.asset(ImagesPath.babyCheckIcon),
//           title: Text(
//             StringManager.isYourBaby,
//             style: Styles.textStyle18.copyWith(
//                 color: ColorManager.mainColor, fontWeight: FontWeight.w500),
//           ),
//           subtitle: Text(
//             StringManager.alreadyBorn,
//             style: Styles.textStyle18.copyWith(
//                 color: ColorManager.mainColor, fontWeight: FontWeight.w500),
//           ),
//           trailing: Transform.scale(
//             scale: 0.75,
//             child: Switch(
//               activeColor: ColorManager.whiteColor,
//               activeTrackColor: ColorManager.mainColor,
//               inactiveThumbColor: ColorManager.whiteColor,
//               inactiveTrackColor: ColorManager.switchIconColor,
//               splashRadius: 50.0,
//               value: isSwitchOn,
//               onChanged: (value) {
//                 setState(() {
//                   isSwitchOn = value;
//                 });
//                 if (isSwitchOn) {
//                   // Navigate
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view.dart';
import 'package:app/features/profile/presentation/view/widgets/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BabyBornCheckedCard extends StatefulWidget {
  const BabyBornCheckedCard({super.key});
  @override
  State<BabyBornCheckedCard> createState() => _BabyBornCheckedCardState();
}

class _BabyBornCheckedCardState extends State<BabyBornCheckedCard> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 9 * SizeConfig.defaultSize!,
      decoration: ShapeDecoration(
        color: ColorManager.babyCheckColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
      ),
      child: Center(
        child: ListTile(
            leading: SvgPicture.asset(ImagesPath.babyCheckIcon),
            title: Text(
              StringManager.isYourBaby,
              style: Styles.textStyle18.copyWith(
                  color: ColorManager.mainColor, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              StringManager.alreadyBorn,
              style: Styles.textStyle18.copyWith(
                  color: ColorManager.mainColor, fontWeight: FontWeight.w500),
            ),
            trailing: const CustomSwitchButtonWithAlert(
                title: StringManager.isYourBabyBorn,
                navigationScreen: PaymantsView(),
                navigationWithNavBar: false)),
      ),
    );
  }
}
