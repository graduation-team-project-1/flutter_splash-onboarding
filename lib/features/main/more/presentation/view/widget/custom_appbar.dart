
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar moreCustomAppBar({required String title}){
  return  AppBar(
        elevation: 0,
        titleSpacing: 2,
        backgroundColor: Colors.transparent,
        title:  Text(
          title,
          style: Styles.textStyle20,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            ImagesPath.arrowBack,
            width: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );
}