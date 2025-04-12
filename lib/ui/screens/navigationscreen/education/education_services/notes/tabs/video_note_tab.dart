import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../../src/src.dart';

class VideoNotesTab extends StatefulWidget {
  const VideoNotesTab({super.key, required this.chapterId});
  final String chapterId;

  @override
  State<VideoNotesTab> createState() => _VideoNotesTabState();
}

class _VideoNotesTabState extends State<VideoNotesTab> {
  List<ChewieController> chewieControllers = [];

  int currentIndex = -1;

  // void playYTVideo(String videoUrl, int selectedIndex) {
  //   final videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';
  //   _controller.load(videoId);
  //   currentIndex = selectedIndex;
  //   setState(() {});
  // }

  void playServerVideo(String videoUrl) {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    controller.initialize().then((_) {
      final chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        looping: false,
        aspectRatio: controller.value.aspectRatio,
      );

      // Add new Chewie controller to the list
      setState(() {
        chewieControllers.add(chewieController);
      });
    }).catchError((e) {
      print("Error initializing video controller: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    final EducationController controller = Get.find<EducationController>();
    controller.fetchVideoNotes(widget.chapterId);
    return Obx(() {
      final notes = controller.videoNotes.value?.data ?? [];
      return controller.isLoadingVideoNotes.value
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : notes.isEmpty
              ? Center(
                  child: Text(
                    "Video notes not found",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              : GridView.builder(
                  itemCount: notes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final note = notes[index].noteVideo?.first;

                    final videoUrl = note?.video ??
                        'https://youtu.be/VamZ-Jr8o5o?si=2wY0M3vTWwB-rEYp';
                    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
                    if (videoId == null) {
                      print("Failed to extract video ID from URL: $videoUrl");
                    } else {
                      print("Extracted Video ID: $videoId");
                    }

                    return InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 250,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 5),
                              height: 250,
                              decoration: BoxDecoration(
                                color: const Color(0xffBBDEFB),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: double.infinity,
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                    initialVideoId: videoId ?? 'iLnmTe5Q2Qw',
                                    flags: YoutubePlayerFlags(
                                      forceHD: true,
                                      autoPlay: false,
                                      enableCaption: false,
                                    )),
                              ),
                            ),
                            Text(
                              note!.title.toString(),
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
    });
  }
}

InkWell buildNotesContainer(
    {required VoidCallback onTap,
    required String note,
    required String pdfUrl,
    required String videoId,
    required BuildContext context}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      height: 250,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5),
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xffBBDEFB),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: videoId.isEmpty ? 'nPt8bK2gbaU' : videoId,
                  flags: YoutubePlayerFlags(
                    forceHD: true,
                    autoPlay: false,
                    enableCaption: false,
                  )),
            ),
          ),
          Text(
            note,
            style: const TextStyle(
              color: Colors.indigo,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
