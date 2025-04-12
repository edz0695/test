import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/videoplayerwidget.dart';
import 'package:payapp/widgets/youtube_video_player.dart';




class VideoDialog extends StatelessWidget {
  final String videoUrl;
  const VideoDialog({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () => Future.value(true),
      child: Dialog(
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        elevation: 0,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon:const Center(child: Icon(Icons.cancel_outlined,size:30,color: Colors.white,)),onPressed: (){
                  Navigator.pop(context);
                },),

                Expanded(child: YoutubeVideoPlayerOsama(),),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
