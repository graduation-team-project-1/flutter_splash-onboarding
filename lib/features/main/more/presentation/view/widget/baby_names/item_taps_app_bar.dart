import 'package:app/core/resource/assets.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/list_items_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar itemTaps({
  required Function(int value) onTap,
  required int currentIndex,
}) {
  return AppBar(
    bottom: TabBar(
      indicatorColor: Colors.transparent,
      onTap: onTap,
      tabs: [
        Tab(
          child: listItems(
            itemValue: currentIndex == 0,
          )[0],
        ),
        Tab(
          child: listItems(
            itemValue: currentIndex == 1,
          )[1],
        ),
        Tab(
          child: listItems(
            itemValue: currentIndex == 2,
          )[2],
        ),
      ],
    ),
    title: Text(
      "Baby’s Name",
      style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: SvgPicture.asset(ImagesPath.arrowBack),
    ),
  );
}
