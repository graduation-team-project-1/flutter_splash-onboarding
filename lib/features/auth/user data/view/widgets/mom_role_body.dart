import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/user%20data/view/widgets/custom_mom_screen_container.dart';
import 'package:flutter/material.dart';

class MomRoleBody extends StatelessWidget {
  const MomRoleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Custom().customPic(
              url: ImagesPath.momScreen,
              context: context,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Select Gender",
            style: Styles.textStyle24.copyWith(color: ColorManager.pinkColor),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomMomContainer(
            title: "Girl",
            backgroundColor: ColorManager.girlColor,
            imageUrl: ImagesPath.girl,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomMomContainer(
            title: "boy",
            backgroundColor: ColorManager.boyColor,
            imageUrl: ImagesPath.boy,
          ),
        ],
      ),
    );
  }
}
