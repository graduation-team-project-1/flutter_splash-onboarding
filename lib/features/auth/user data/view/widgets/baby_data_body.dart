// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app/core/resource/assets.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_birth_date.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_continue_button.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_name_input.dart';

class BabyDataBody extends StatelessWidget {
  const BabyDataBody({
    Key? key,
    required this.isBoy,
  }) : super(key: key);

  final bool isBoy;

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
          ContinueButton(
            isBoy: isBoy,
          )
        ],
      ),
    );
  }
}
