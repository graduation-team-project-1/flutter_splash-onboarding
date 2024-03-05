import 'package:app/core/resource/assets.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_birth_date.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_continue_button.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_name_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BabyDataBody extends StatelessWidget {
  const BabyDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SvgPicture.asset(ImagesPath.momScreen),
          const SizedBox(
            height: 40,
          ),
          const BabyName(),
          const SizedBox(
            height: 20,
          ),
          const BabyBirthDay(),
          const SizedBox(
            height: 20,
          ),
          const ContinueButton()
        ],
      ),
    );
  }
}
