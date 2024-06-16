import 'package:app/core/resource/assets.dart';
import 'package:app/features/baby_home/view/widget/baby_info_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart%20';

class BabyInformationView extends StatelessWidget {
  const BabyInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("About My Baby"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(ImagesPath.arrowBack),
        ),
      ),
      body: BabyInformationViewBody(),
    );
  }
}
