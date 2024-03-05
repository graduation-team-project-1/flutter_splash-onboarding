import 'package:app/core/resource/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Custom {
  AppBar customAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          ImagesPath.arrowBack,
          width: 30,
        ),
      ),
    );
  }

  SizedBox customPic({required String url, required BuildContext context}) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.9,
      child: SvgPicture.asset(
        url,
        width:350
      ),
    );
  }
}
