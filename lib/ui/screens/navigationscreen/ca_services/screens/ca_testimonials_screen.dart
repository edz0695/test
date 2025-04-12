import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../dialogs/loaderdialog.dart';
import '../ca_widget/ca_video_consumer.dart';

class CaTestimonials extends StatefulWidget {
  final List<dynamic> testimonials;
  const CaTestimonials({super.key, required this.testimonials});

  @override
  State<CaTestimonials> createState() => _CaTestimonialsState();
}

class _CaTestimonialsState extends State<CaTestimonials> {
  final bool _isLoading = true;
  final int _currentTestimonialIndex = 0;
  late CarouselController _carouselController;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  void _startAutoScrollTimer() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // _carouselController.n();
    });
  }

  void _cancelAutoScrollTimer() {
    _autoScrollTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 60, height: 1, color: const Color(0xffD0CFCE)),
              const SizedBox(width: 15),
              const Text(
                "Testimonials",
                style: TextStyle(
                  fontSize: 14,
                  color: ThemeColors.darkBlueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 15),
              Container(width: 60, height: 1, color: const Color(0xffD0CFCE)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildTestimonialsCarousel(),
      ],
    );
  }

  Widget _buildTestimonialsCarousel() {
    return widget.testimonials.isNotEmpty
        ? Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        _cancelAutoScrollTimer();
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.testimonials.length,
                        itemBuilder: (context, index) {
                          final testimonial = widget.testimonials[index];
                          return _buildTestimonialItem(testimonial, index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : loading();
  }

  Widget _buildTestimonialItem(Map<String, dynamic> testimonial, int index) {
    final String type = testimonial['type'] ?? '';
    final String videoUrl = testimonial['video'] ?? '';
    final testimonials = widget.testimonials[index];

    if (type == 'youtube') {
      final String videoId =
          YoutubePlayerController.convertUrlToId(videoUrl) ?? '';
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(2, -2),
                            color: Colors.grey.withOpacity(.5))
                      ]),
                  child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .push(TutorialOverlay(youtubeId: videoId)),
                      child: YoutubeVideoPlayerOsamaTwo(videoId: videoId))),
            ),
          ),
          testimonials.containsKey('title')
              ? Text(
                  testimonials['title'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
        ],
      );
    } else if (type == 'server') {
      final String videoId =
          YoutubePlayerController.convertUrlToId(testimonials['video']) ?? '';

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(2, -2),
                            color: Colors.grey.withOpacity(.5))
                      ]),
                  child: YoutubeVideoPlayerOsamaTwo(videoId: videoId)),
            ),
          ),
          testimonials.containsKey('title')
              ? Text(
                  testimonials['title'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
        ],
      );
    } else {
      return Container();
    }
  }
}

class ServerVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;

  const ServerVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  _ServerVideoPlayerState createState() => _ServerVideoPlayerState();
}

class _ServerVideoPlayerState extends State<ServerVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = true;
        });
        // Add logic to switch to full screen mode or any other action
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Adding border radius

            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Image.network(
                    widget.thumbnailUrl,
                    loadingBuilder: (context, child, loadingProgress) =>
                        const CircularProgressIndicator(),
                    errorBuilder: (context, url, error) =>
                        const Center(child: Text("Unknown Error")),
                    fit: BoxFit.cover,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class YoutubeVideoPlayerOsamaTwo extends StatefulWidget {
  final String videoId;

  const YoutubeVideoPlayerOsamaTwo({super.key, required this.videoId});

  @override
  State<YoutubeVideoPlayerOsamaTwo> createState() =>
      _YoutubeVideoPlayerOsamaTwoState();
}

class _YoutubeVideoPlayerOsamaTwoState
    extends State<YoutubeVideoPlayerOsamaTwo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: YoutubePlayer(
          controller: _controller,
        ),
      ),
    );
  }
}
