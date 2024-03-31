
import 'package:app/core/resource/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SvgPicture.asset(
          ImagesPath.bannerDots,
        ),
      ),
    );
  }
}
