import 'package:app/core/resource/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageDisplay extends StatelessWidget {
  const CustomImageDisplay(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width,
      required this.fit});
  final String imageUrl;
  final double height;
  final BoxFit fit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: ShapeDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: ColorManager.mainColor,
      )),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
