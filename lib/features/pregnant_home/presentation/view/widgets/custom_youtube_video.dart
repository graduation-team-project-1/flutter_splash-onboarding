import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubeVideo extends StatefulWidget {
  final String videoLink;

  const CustomYoutubeVideo({Key? key, required this.videoLink})
      : super(key: key);

  @override
  _CustomYoutubeVideoState createState() => _CustomYoutubeVideoState();
}

class _CustomYoutubeVideoState extends State<CustomYoutubeVideo> {
  late YoutubePlayerController _controller;
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          forceHD: false,
          enableCaption: true,
          isLive: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoId == null
        ? const Center(child: Text('Invalid video link'))
        : YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true, // Show progress indicator
            progressIndicatorColor:
                Colors.red, // Customize progress indicator color
            progressColors: ProgressBarColors(
              // Customize progress bar colors
              playedColor: Colors.red,
              handleColor: Colors.red,
            ),
            onReady: () {
              _controller.addListener(() {
                setState(() {});
              });
            },
          );
  }
}
