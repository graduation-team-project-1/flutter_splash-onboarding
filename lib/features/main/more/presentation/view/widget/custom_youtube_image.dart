import 'package:app/core/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';

class CustomYoutubeImage extends StatelessWidget {
  final String youtubeLink;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomYoutubeImage(
      {super.key,
      required this.youtubeLink,
      required this.height,
      required this.width,
      required this.fit});

  String _getYoutubeThumbnail(String youtubeLink) {
    final Uri uri = Uri.parse(youtubeLink);
    final String? videoId = uri.queryParameters['v'];
    if (videoId == null) {
      throw ArgumentError('Invalid YouTube link');
    }
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final String thumbnailUrl = _getYoutubeThumbnail(youtubeLink);
    return CustomImageDisplay(
      imageUrl: thumbnailUrl,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
