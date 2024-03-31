import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/gradient_text.dart';
import 'package:app/features/auth/user%20data/view/mom_role.dart';
import 'package:app/features/auth/user%20data/view/pregnant_role.dart';
import 'package:app/features/auth/user%20data/view/widgets/custom_user_role.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRoleBody extends StatelessWidget {
  const UserRoleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GradientText(
              text: "Select Your Role",
              gradient: ColorManager.primaryColorGradient,
              style: Styles.textStyle32,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  const Pregnant(),
                );
              },
              child: const CustomUserRole(
                title: "Pregnant",
                imageUrl: ImagesPath.pregnant,
                imageSize: 60,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //mom
            InkWell(
              onTap: () {
                Get.to(
                  const MomRole(),
                );
              },
              child: const CustomUserRole(
                title: "Mom",
                imageUrl: ImagesPath.mom,
                imageSize: 110,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //montiring
            InkWell(
              onTap: () {},
              child: const CustomUserRole(
                title: "Monitoring",
                imageUrl: ImagesPath.montoringRole,
                imageSize: 120,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
