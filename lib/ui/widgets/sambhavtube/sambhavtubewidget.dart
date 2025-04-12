import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:chewie/chewie.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import '../../../src/src.dart';

class SambhavTubeWidgetTile extends StatefulWidget {
  final SambhavTubeVideosData? video;
  final SambhavTubeUser? user;

  const SambhavTubeWidgetTile({super.key, required this.video, this.user});

  @override
  State<SambhavTubeWidgetTile> createState() => _SambhavTubeWidgetTileState();
}

class _SambhavTubeWidgetTileState extends State<SambhavTubeWidgetTile> {
  // final Map video;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => SambhavTubeVideoScreen(
                uId: '${widget.user?.id}',
                userLogo: '${widget.user?.logo}',
                userName: '${widget.user?.name}',
                title: '${widget.video?.title}',
                videoUrl: '${widget.video?.video}',
                description: '${widget.video?.title}',
                thumbnail: '${widget.video?.thumbnail}',
                videoId: '${widget.video?.id}',
                views: widget.video?.views,
                likes: widget.video?.like,
                comments: widget.video?.comments,
                dislikes: widget.video?.share,
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${widget.video?.thumbnail}",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                    ),
                  ),
                  // Positioned(
                  //   bottom: 10,
                  //   right: 10,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.black.withOpacity(0.7),
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //     child: const Text('10:31',
                  //         style: TextStyle(color: Colors.white, fontSize: 10)),
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 10,
                  //   left: 10,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.remove_red_eye, color: Colors.white, size: 15,),
                  //         SizedBox(width: 3,),
                  //         Text('100', style: TextStyle(color: Colors.white, fontSize: 10)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // const SizedBox(height: 8),
            // SizedBox(
            //   width: MediaQuery
            //       .of(context)
            //       .size
            //       .width - 20,
            //   child: Text(
            //     widget.video.title,
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            const SizedBox(height: 8),
            Row(
              children: [
                // const CircleAvatar(
                //     backgroundImage: NetworkImage('https://picsum.photos/200')),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.video?.title}",
                        style: TextStyle(
                            fontSize: Dimensions.fontSizeSmall,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.video?.description}",
                        style: TextStyle(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                          '${widget.video?.like} likes • ${widget.video?.views} views ',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                // IconButton(
                //   icon: Icon(
                //       true ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined),
                //   color: true ? Colors.blue : Colors.black,
                //   onPressed: () {},
                // ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                // IconButton(
                //     onPressed: () {},
                //     icon: isLiked
                //         ? Icon(Icons.favorite, color: Colors.red)
                //         : Icon(Icons.favorite_border, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SambhavTubeVideoScreen extends StatefulWidget {
  final String videoUrl,
      title,
      description,
      videoId,
      thumbnail,
      userName,
      userLogo,
      uId;
  final int? views, likes, dislikes;
  final List<SambhavTubeVideosComment>? comments;

  const SambhavTubeVideoScreen(
      {super.key,
      required this.videoUrl,
      required this.title,
      required this.description,
      required this.views,
      required this.videoId,
      required this.likes,
      required this.dislikes,
      required this.comments,
      required this.thumbnail,
      required this.userName,
      required this.userLogo,
      required this.uId});

  @override
  _SambhavTubeVideoScreenState createState() => _SambhavTubeVideoScreenState();
}

class _SambhavTubeVideoScreenState extends State<SambhavTubeVideoScreen> {
  int likes = 0;
  int dislikes = 0;
  int views = 0;
  bool liked = false;
  bool disliked = false;
  late VideoPlayerController _videoPlayerController;
  bool isLoading = true;
  List relatedVideos = [];
  // List<SambhavTubeVideosComment> comments = [];
  final TextEditingController commentController = TextEditingController();
  String? authToken;

  ChewieController? _chewieController;
  bool _isInitializing = false;

  SambhavTubeController controller = Get.find<SambhavTubeController>();

  Future<void> _initializeVideoPlayer() async {
    if (_isInitializing) return;
    _isInitializing = true;

    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    try {
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        placeholder: Container(color: Colors.grey),
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.indigo,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.blueGrey,
        ),
      );
      setState(() {}); // Update UI after initialization
    } catch (e) {
      debugPrint('Error initializing video player: $e');
    } finally {
      _isInitializing = false; // Reset initialization flag
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    loadToken();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                foregroundImage: NetworkImage(widget.thumbnail),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.userName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          // bottom: bottom,
          titleTextStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .045,
              color: ThemeColors.primaryBlueColor,
              fontWeight: FontWeight.bold),
          titleSpacing: 5,
          leading: back()),
      body: FutureBuilder<SambhavTubeVideosData?>(
          future: controller.fetchSambhavtubeVideoById(widget.videoId),
          builder: (context, snapshot) {
            final video = snapshot.data;
            final comments = video?.comments;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading();
            } else if (snapshot.connectionState == ConnectionState.none ||
                snapshot.data == null ||
                snapshot.hasError) {
              return Center(
                child: Text("No video found"),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 250,
                    child: _chewieController != null &&
                            _videoPlayerController.value.isInitialized
                        ? Chewie(controller: _chewieController!)
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ),

                // Spacer
                SizedBox(height: 10),

                // UI for likes, dislikes, comments, views
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined),
                          color: liked ? Colors.blue : null,
                          onPressed: () {
                            setState(() {
                              if (!liked) {
                                video!.like = video.like++;
                                if (disliked) {
                                  // video.dislike = (video.dislike ?? 0) - 1;
                                  disliked = false;
                                }
                                liked = true;
                              } else {
                                video!.like = video.like--;
                                liked = false;
                              }
                            });
                          },
                        ),
                        Text(widget.likes.toString())
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_down_outlined),
                          color: disliked ? Colors.red : null,
                          onPressed: () {
                            setState(() {
                              if (!disliked) {
                                dislikes++;
                                if (liked) {
                                  likes--;
                                  liked = false;
                                }
                                disliked = true;
                              } else {
                                dislikes--;
                                disliked = false;
                              }
                            });
                          },
                        ),
                        Text(widget.dislikes.toString())
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.comment_outlined),
                          onPressed: () => _showCommentDialog(comments),
                        ),
                        Text(widget.comments!.length.toString())
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                              "assets/icons/share-1-svgrepo-com.svg",
                              color: Colors.blue,
                              height: 27,
                              width: 27),
                          onPressed: () {
                            _showCommentDialog(comments);
                          },
                        ),
                        Text(widget.views.toString())
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: Divider(
                        height: 2,
                      )),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Related videos",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          // color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins")),
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 100),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: relatedVideos.length,
                        itemBuilder: (context, i) {
                          // return SambhavTubeWidgetTile(video: video);
                          SizedBox();
                          return null;
                        })),

                // Expanded(
                //     child: ListView.builder(
                //   itemCount: 50,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //       margin: EdgeInsets.only(bottom: 5),
                //       child: ListTile(
                //         leading: CircleAvatar(
                //           backgroundColor: Colors.black,
                //           foregroundImage: NetworkImage(
                //               "https://storage.googleapis.com/cms-storage-bucket/1e32341162e45fcf94a3.png"),
                //         ),
                //         style: ListTileStyle.list,
                //         onTap: () {},
                //         title: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Username",
                //                 style: TextStyle(
                //                     fontSize: 14,
                //                     color: Colors.brown,
                //                     fontWeight: FontWeight.w600)),
                //             Text("Sample comment $index",
                //                 style: TextStyle(
                //                     fontSize: 14, fontWeight: FontWeight.w400))
                //           ],
                //         ),
                //         trailing: Text(
                //           "2h ago",
                //           style: TextStyle(fontSize: 12, color: Colors.grey),
                //         ),
                //       ),
                //     );
                //   },
                // ))
                // Other crucial UI elements can be added here
              ],
            );
          }),
    );
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      authToken = prefs.getString('token');
      print("Token : $authToken");
    });
  }

  void incrementViewCount() {
    // Increment view count when the video screen is displayed
    setState(() {
      views++;
    });
  }

  String getFetchCommentsUrl() {
    return "https://xyzabc.sambhavapps.com/v1/st/video/comment/${widget.videoId}";
  }

  String getAddCommentUrl() {
    return "https://xyzabc.sambhavapps.com/v1/st/video/comment/add";
  }

  void fetchComments() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      authToken = prefs.getString('token');
      print("Token : $authToken");
      var response = await http.get(
        Uri.parse(getFetchCommentsUrl()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)["data"];
        setState(() {
          // comments = data["comments"];
        });
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void addComment() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      authToken = prefs.getString('token');

      var response = await http.post(Uri.parse(getAddCommentUrl()),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $authToken',
          },
          body: jsonEncode(
              {'postedby': widget.videoId, 'comment': commentController.text}));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        controller.fetchSambhavtubeVideoById(widget.videoId);
        commentController.clear();
        Get.back();
      } else {
        throw Exception('Failed to post comment');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _showCommentDialog(List<SambhavTubeVideosComment>? comments) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(5),
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: Column(
            children: [
              Text(
                "Comments",
                style: TextStyle(
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              height(20),
              TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "Add comment here...",
                  hintStyle: TextStyle(
                      fontSize: Dimensions.fontSizeSmall, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.indigo,
                    ),
                    onPressed: addComment,
                  ),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 300,
            width: 400,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: widget.comments == null
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: Text(
                              "Comments not found!",
                              style: TextStyle(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Colors.grey),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                          widget.comments!.length,
                          (index) {
                            var comment = widget.comments![index];
                            return ListTile(
                              leading: CircleAvatar(),
                              title: Text(
                                comment.postedBy!,
                                style: TextStyle(
                                    fontSize: Dimensions.fontSizeSmall,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                comment.comment!,
                                style: TextStyle(
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          },
                        )),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
