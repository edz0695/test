import 'package:flutter/material.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../../provider/caservicesprovider/ca_services_provider.dart';
import '../../../../../themes/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CAVideoConsumer extends StatelessWidget {
  const CAVideoConsumer({
    super.key,
  });

  Future<String> _fetchThumbnail(String videoId, String apiKey) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/videos?id=$videoId&key=$apiKey&part=snippet'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final thumbnailUrl =
          data['items'][0]['snippet']['thumbnails']['default']['url'];
      return thumbnailUrl;
    } else {
      throw Exception('Failed to load thumbnail');
    }
  }

// If the requirement is just to play a single video.
  // final _controller = YoutubePlayerController.fromVideoId(
  //   videoId: 'YMx8Bbev6T4',
  //   autoPlay: false,
  //   params: const YoutubePlayerParams(showFullscreenButton: true),
  // );
  @override
  Widget build(BuildContext context) {
    return Consumer<CaServicesProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 60, height: 1, color: const Color(0xffD0CFCE)),
                  const SizedBox(width: 15),
                  const Text(
                    "Tutorial Video",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.darkBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                      width: 60, height: 1, color: const Color(0xffD0CFCE)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _fetchThumbnail(
                  "YMx8Bbev6T4", "AIzaSyC6IeO9NUabaHFtaqwXOHguEe0rrsm8lxo"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ShimmerAnimation(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                    ),
                  ); // Display a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // Display an error message if fetching data fails
                } else {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          snapshot.data.toString(),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () => Navigator.of(context)
                              .push(TutorialOverlay(youtubeId: "YMx8Bbev6T4")),
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialOverlay extends ModalRoute<void> {
  final String youtubeId;

  TutorialOverlay({required this.youtubeId});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: youtubeId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    return YoutubePlayerScaffold(
      controller: controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Center(child: player);
      },
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
