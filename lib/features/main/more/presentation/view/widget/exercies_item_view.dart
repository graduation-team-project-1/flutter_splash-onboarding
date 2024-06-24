import 'package:app/features/main/more/presentation/view/widget/custom_appbar.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_youtube_video.dart';
import 'package:flutter/material.dart';

class ExerciesItemView extends StatelessWidget {
  const ExerciesItemView({super.key, required this.youtubeLink});
  final String youtubeLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: moreCustomAppBar(title: "Exercies"),
      body: CustomYoutubeVideo(
        videoLink: youtubeLink,
      ),
    );
  }
}
