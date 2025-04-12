import 'package:flutter/material.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/themes/colors.dart';
//import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  List videoLacList = [
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://study.com/cimages/videopreview/videopreview-full/y476ogungq.jpg"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://5.imimg.com/data5/TL/IV/MY-7338203/physics-tutorials-for-class-9-to-12-500x500.png"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://i.ytimg.com/vi/G2-8W2a43N4/maxresdefault.jpg"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://i.ytimg.com/vi/Y_TPbCIy9yc/maxresdefault.jpg"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://study.com/cimages/videopreview/videopreview-full/y476ogungq.jpg"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://5.imimg.com/data5/TL/IV/MY-7338203/physics-tutorials-for-class-9-to-12-500x500.png"
    },
    {
      "title" : "Lorem ipsum dolor sit amet",
      "subTitle" : "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint",
      "image" : "https://i.ytimg.com/vi/Y_TPbCIy9yc/maxresdefault.jpg"
    },
  ];

  List<IconData> actionsIcons = [
    // Icons.cast_sharp,
    // Icons.notifications_outlined,
    Icons.search,
    Icons.account_circle
  ];
  String selectedCategory = "All";
  double _progressValue = 0.0;
  late VideoPlayerController _videoPlayerController;
  final bool _liked = false;
  bool _isPlaying = false;
  bool _isTachinVideo = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
           _progressValue = _videoPlayerController.value.position.inMilliseconds.toDouble() /
              _videoPlayerController.value.duration.inMilliseconds.toDouble();
        });
      });
  }
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: ThemeColors.primaryBlueColor,
      child: SafeArea(
        child: Scaffold(
          body: ListView(

            children: [
              Stack(
                children: [
                  _videoPlayerController.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: 16/9,
                    child: InkWell(
                        onTap: (){
                          setState(() {
                            _isTachinVideo = !_isTachinVideo;
                          });
                        },
                        child: VideoPlayer(_videoPlayerController)),
                  )
                      : const ShimmerAnimation(),




                  //arrow back position
                  _isTachinVideo? Positioned(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTachinVideo = !_isTachinVideo;
                            _isPlaying = !_isPlaying;
                            if (_isPlaying) {
                              _videoPlayerController.play();
                            } else {
                              _videoPlayerController.pause();
                            }
                          });
                        },
                        child: Container(
                            width: size.width, height: 230,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                            ),
                            child: _isPlaying ? const Icon(Icons.pause, color: Colors.white, size: 80,):const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 80,))
                    ),
                  ):const Center(),


                  _isTachinVideo ? Positioned(
                    top: 20,
                    left: 20,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,)
                      ),
                    ),
                  ) : const Center(),

                  _isTachinVideo ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Slider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.red.withOpacity(0.3),
                        value: _progressValue,
                        onChanged: (value) {
                          setState(() {
                            _progressValue = value;
                            final position = _progressValue * _videoPlayerController.value.duration.inMilliseconds;
                            _videoPlayerController.seekTo(Duration(milliseconds: position.round()));
                            printThis("this is vaird $value");
                          });
                        },
                      ),
                    ),
                  )  :const Center(),

                  //   Positioned(
                  //     // top: 0,
                  //   bottom: 0,
                  //   left: 0,
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.thumb_up),
                  //       SizedBox(width: 8),
                  //       Text('100', style: TextStyle(fontSize: 16)),
                  //       SizedBox(width: 16),
                  //       Icon(Icons.remove_red_eye),
                  //       SizedBox(width: 8),
                  //       Text('1K', style: TextStyle(fontSize: 16)),
                  //     ],
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [Colors.black.withOpacity(0.0), Colors.black],
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //       ),
                  //     ),
                  //     padding: EdgeInsets.all(16.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Video Title',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 24.0,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         SizedBox(height: 8.0),
                  //         Text(
                  //           'Video Description',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 16.0,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200')),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('channelName',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('100 likes • 2.5M views • 1 year ago', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
                        ],
                      ),

                    ),
                    // IconButton(
                    //   icon: Icon(_isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined),
                    //   color: _isLiked ? Colors.blue : Colors.black,
                    //   onPressed: _toggleLike,
                    // ),
                    // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                    // IconButton(
                    //     onPressed: (){},
                    //     icon: icon
                    // )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.thumb_up, color: ThemeColors.primaryBlueColor,),
                        SizedBox(height: 3,),
                        Text("120 Liks",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ThemeColors.primaryBlueColor,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.thumb_down_alt_outlined, color: Colors.black54,),
                        SizedBox(height: 3,),
                        Text("120 Dislikes",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.comment_outlined, color: Colors.black54,),
                        SizedBox(height: 3,),
                        Text("Comment",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share, color: Colors.black54,),
                        SizedBox(height: 3,),
                        Text("Share",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.download, color: Colors.black54,),
                        SizedBox(height: 3,),
                        Text("Download",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade400,),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("Vide title here",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the....",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Related Videos",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      for(var i=0;i<videoLacList.length;i++)
                        buildSingleChapter(
                            image: videoLacList[i]['image'],
                            size: size,
                            title: videoLacList[i]["title"],
                            subTitle: videoLacList[i]["subTitle"],
                            onTap: (){}
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  InkWell buildSingleChapter({
    required Size size,
    required String title,
    required String subTitle,
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [ BoxShadow(
              offset: const Offset(1,1),
              color: ThemeColors.primaryBlueColor.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 3
          ),],
        ),
        child:  Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(image, width: 100, height: 100, fit: BoxFit.cover,),
            ),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width*.50,
                  child: const Text("Modern Physics || Modern Physics Full Lecture Course",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width*.50,
                  child:const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('channelName',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('17K Views . 2 Month ago', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500,  fontSize: 14,)),
                    ],
                  ),
                  ),

              ],
            )
          ],
        ),

      ),
    );
  }

  // PreferredSizeWidget navBar(BuildContext context) {
  //   var tubeProvider = Provider.of<EductionFormProvider>(context,listen: false);
  //   return ScrollAppBar(
  //     controller: controller,
  //     title: Image.asset(
  //       "assets/images/logo.png",
  //       height: 20,
  //       fit: BoxFit.contain,
  //     ),
  //     bottom: PreferredSize(
  //         preferredSize: const Size.fromHeight(50.0),
  //         child: SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //           child: Row(
  //             children: [
  //               // TubeCategoriesList(),
  //
  //               Wrap(
  //                   spacing: 5,
  //                   children: tubeProvider.tubecate
  //                       .map((category) => FilterChip(
  //                           showCheckmark: false,
  //                           label: Text(
  //                             category.name,
  //                             style: TextStyle(
  //                               color: selectedCategory == category ? Colors.white : Colors.black
  //                             ),
  //                           ),
  //                           backgroundColor: Colors.grey.shade200,
  //                           selectedColor: Colors.grey.shade600,
  //                           selected: selectedCategory == category,
  //                           onSelected: (bool value) {})).toList())
  //             ],
  //           ),
  //         )),
  //   );
  // }
}
