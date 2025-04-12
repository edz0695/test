import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_parser/youtube_parser.dart';
import '../../../../../../themes/colors.dart';
import 'package:http/http.dart' as http;

import 'player_widget.dart';

class SingleVideoLac extends StatefulWidget {
  final String logo;
  final String chapterName;
  final String chapterId;

  const SingleVideoLac({
    super.key,
    required this.logo,
    required this.chapterName,
    required this.chapterId,
  });

  @override
  State<SingleVideoLac> createState() => _SingleVideoLacState();
}

class _SingleVideoLacState extends State<SingleVideoLac> {
  @override
  Widget build(BuildContext context) {
    var videosLength = 0;
    Future<String> loadToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token') ??
          ''; // Default to empty string if token is not found
    }

    print("CHAPTER ID ${widget.chapterId}");

    Future callApiWithToken(String token) async {
      try {
        // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
        var apiUrl = Uri.parse(
            'https://xyzabc.sambhavapps.com/v1/education/video/long/chapter/${widget.chapterId}');

        var response = await http.get(
          apiUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          var decodedResponse = jsonDecode(response.body);
          print("Your response");
          print(decodedResponse["data"]);
          return decodedResponse["data"];
        } else {
          print('API Request Failed with Status Code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error calling API: $error');
      }
    }

    Future<String> fetchThumbnail(String videoId, String apiKey) async {
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

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: '', size: 50),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.75,
              child: FutureBuilder<String>(
                future: loadToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String token = snapshot.data ?? '';
                    return FutureBuilder(
                      future: callApiWithToken(token),
                      builder: (context, apiSnapshot) {
                        if (apiSnapshot.connectionState ==
                            ConnectionState.done) {
                          var res = apiSnapshot.data;
                          if (res is List) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    widget.logo == "undefined"
                                        ? Image.network(
                                            widget.logo,
                                            width: 40,
                                            height: 40,
                                          )
                                        : Image.network(
                                            widget.logo,
                                            width: 40,
                                            height: 40,
                                          ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          res.first['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${res.first['video'].length} Video Lectures",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                height(20),
                                Expanded(
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          height(10),
                                      shrinkWrap: true,
                                      itemCount: res.first["video"].length,
                                      itemBuilder: (context, index) {
                                        return Builder(
                                          builder: (context) {
                                            final videoData =
                                                res.first["video"][index];
                                            return InkWell(
                                              onTap: () =>
                                                  Get.to(() => PlayerWidget(
                                                        videoData:
                                                            res.first["video"],
                                                        videoUrl:
                                                            videoData['video'],
                                                      )),
                                              child: Card(
                                                color:
                                                    ThemeColors.lightBlueCard,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 80,
                                                        child:
                                                            _buildSingleVideo(
                                                                videoData),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            res.first["name"],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13),
                                                          ),
                                                          Text(
                                                              videoData[
                                                                  "title"],
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                ),
                              ],
                            );
                          }

                          return Text(res.toString());
                        } else {
                          return Text("Loading");
                        }
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(List<Map<String, dynamic>> videos) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.8,
          ),
          items: videos.map((video) {
            return Builder(
              builder: (BuildContext context) {
                return _buildVideoItem(video);
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            videos.length,
            (index) => Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleVideo(Map<String, dynamic> video) {
    return _buildVideoItem(video);
  }

  Widget _buildVideoItem(Map<String, dynamic> video) {
    print("Videos");
    print(video);
    if (video.isEmpty) {
      return Container(); // Handle null or empty video data
    }

    if (video["type"] == null || video["video"] == null) {
      return Container(); // Handle null or missing type or video
    }

    String? videoUrl = video["video"];

    String? videoId;

    // Check if video URL is not null or empty
    if (videoUrl != null && videoUrl.isNotEmpty) {
      videoId = getIdFromUrl(videoUrl);
    }

    if (video["type"] == "youtube" && videoId != null) {
      Future<String> fetchThumbnail(String videoId, String apiKey) async {
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

      print("Video Url : $videoUrl");
      print("Video Id : $videoId");
      return FutureBuilder(
        future:
            fetchThumbnail(videoId, "AIzaSyC6IeO9NUabaHFtaqwXOHguEe0rrsm8lxo"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ShimmerAnimation(
                height: 80,
              ),
            ); // Display a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Display an error message if fetching data fails
          } else {
            return Stack(
              children: [
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      snapshot.data.toString(),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ); // Display the thumbnail image once data is loaded
          }
        },
      );
    } else {
      print("Our video is not a youtuble video ${videoUrl!}");

      Future<String?> getThumbnailFromVideo() async {
        // XFile thumbnailFile = await VideoThumbnail.thumbnailFile(
        //   video: videoUrl,
        //   thumbnailPath: (await getTemporaryDirectory()).path,
        //   imageFormat: ImageFormat.WEBP,
        //   maxHeight: 64,
        //
        //   // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        //   quality: 75,
        // );
        //   print("Thumbnail path : ${thumbnailFile.path}");
        return "Thumbnail";
      }

      return FutureBuilder(
        future: getThumbnailFromVideo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ShimmerAnimation(
                height: 80,
              ),
            ); // Display a loading indicator while fetching data
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text(
                'Error: ${snapshot.error}'); // Display an error message if fetching data fails
          } else {
            return Stack(
              children: [
                Image.file(
                  File(snapshot.data!.toString()),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ],
            );
          }
        },
      );
    }
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(".............VIDEO URL ${widget.videoUrl}");
    return _controller.value.isInitialized
        ? VideoPlayer(_controller)
        : Center(child: CircularProgressIndicator());
  }
}
