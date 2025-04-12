import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoPlayerOsama extends StatefulWidget {
  YoutubeVideoPlayerOsama({super.key, this.videoUrl});

  String? videoUrl;

  @override
  State<YoutubeVideoPlayerOsama> createState() =>
      _YoutubeVideoPlayerOsamaState();
}

class _YoutubeVideoPlayerOsamaState extends State<YoutubeVideoPlayerOsama> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    String? videoId = YoutubePlayerController.convertUrlToId(
        widget.videoUrl ?? 'https://youtu.be/YMx8Bbev6T4');
    controller = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        child: YoutubePlayer(
          controller: controller,
        ),
      ),
    );
  }
}
