import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../src/src.dart';
import 'widgets/actions_button_widget.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget(
      {super.key, required this.videoData, required this.videoUrl});
  final List videoData;
  final String videoUrl;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late YoutubePlayerController _controller;
  String title = '';
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();

    final String videoId = YoutubePlayer.convertUrlToId(
          widget.videoUrl,
        ) ??
        '';
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          forceHD: true,
          autoPlay: false,
          enableCaption: false,
        ));
  }

  void playVideo(String videoUrl, String text, int selectedIndex) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';
    _controller.load(videoId);
    title = text;
    currentIndex = selectedIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final firstVideo = widget.videoData.first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: back(),
        centerTitle: true,
        title: Text(
          title.isEmpty ? firstVideo['title'] : title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Video Player
            YoutubePlayer(
              controller: _controller,
            ),

            // Video Title
            Card(
              color: ThemeColors.lightBlueCard,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isEmpty ? firstVideo['title'] : title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: ActionsButtonWidget(),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Related Vidoes",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Related Videos Section
            SizedBox(
              height: Get.size.height * 0.5,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: widget.videoData.length,
                itemBuilder: (context, index) {
                  final video = widget.videoData[index];
                  final videoId = YoutubePlayer.convertUrlToId(video["video"])!;
                  final thumbnail = YoutubePlayer.getThumbnail(
                    videoId: videoId,
                  );

                  return GestureDetector(
                    onTap: () =>
                        playVideo(video["video"], video['title'], index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Video Thumbnail
                          Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                thumbnail,
                                height: 80,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Video Title
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  video["title"] ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                currentIndex == index
                                    ? Icon(
                                        Icons.play_arrow,
                                        color: Colors.indigo,
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
