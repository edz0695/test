import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPostOsama extends StatefulWidget {
  final String videoLink;

  const VideoPostOsama({super.key, required this.videoLink});

  @override
  State<StatefulWidget> createState() => _VideoPostOsamaState();
}

class _VideoPostOsamaState extends State<VideoPostOsama> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.contentUri(Uri.parse(widget.videoLink));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: false,
      looping: false,
      showControls: true,
      errorBuilder: (context, errorMessage) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.6),
          ),
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.blue,
        handleColor: Colors.yellow,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.black.withOpacity(.4),
      ),
      placeholder: Container(
        color: ThemeColors.backgroundLightBlue,
      ),
      autoInitialize: true,
    );

    _videoPlayerController.addListener(_onVideoPlayerChanged);
  }

  void _onVideoPlayerChanged() {
    if (_isVisible==false) {
        _videoPlayerController.pause();
      }
  }

  void _onVideoPlayerCh() {
    if (_isVisible) {
      if (_videoPlayerController.value.isPlaying) {
        // Video was tapped to pause
        print('Video tapped to pause');
      } else {
        // Video was tapped to play
        print('Video tapped to play');
      }
    }


  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoLink),
      onVisibilityChanged: (info) {
        setState(() {
          _isVisible = info.visibleFraction > .5;
        });
      },
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(
          key: Key(widget.videoLink),
          controller: _chewieController,
        ),
      ),
    );
  }
}
