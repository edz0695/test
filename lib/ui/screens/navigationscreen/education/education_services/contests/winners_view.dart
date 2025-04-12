import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/widgets/youtube_video_player.dart';

class ViewWinners extends StatelessWidget {
  const ViewWinners({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Winners',
        size: 55,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WinnerVideoBanner(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                    buildContainer(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WinnerVideoBanner extends StatelessWidget {
  const WinnerVideoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.cyan.withOpacity(.3),
        // image: const DecorationImage(
        //   fit: BoxFit.cover,
        //   image: NetworkImage(
        //     'https://th.bing.com/th/id/OIP.SCZZKISHtpPCMpLg-PVVKwHaEK?pid=ImgDet&rs=1',
        //   ),
        // ),
      ),
      child: YoutubeVideoPlayerOsama(),
    );
  }
}

Container buildContainer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10, top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.teal.withOpacity(.45),
    ),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: ThemeColors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0'),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Winner name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 170,
                child: Text(
                  'Small hint about the winner ' * 6,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ThemeColors.darkBlueColor,
                    size: 25,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '410',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: ThemeColors.darkBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
          ],
        ),
      ],
    ),
  );
}
