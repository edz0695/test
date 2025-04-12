import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:payapp/themes/colors.dart';

import '../../../../../widgets/youtube_video_player.dart';

class TrainingTab extends StatefulWidget {
  const TrainingTab({super.key});

  @override
  State<TrainingTab> createState() => _TrainingTabState();
}

class _TrainingTabState extends State<TrainingTab> {
  int selectedIndex = 0;

  List<String> trainings = [
    'Training sessions',
    'Training Videos',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Center(
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildSubTabItem(
                trainings[index],
                () => setState(() {
                  selectedIndex = index;
                }),
                selected: selectedIndex == index,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            Column(
              children: [
                Center(
                  child: Lottie.asset('assets/lottie/not_found.json'),
                ),
                const Text('No Session found')
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 3),
                      color: const Color(0xff2057A6).withOpacity(0.2),
                      blurRadius: 20.0,
                    ),
                  ],
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3), width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: YoutubeVideoPlayerOsama(
                  videoUrl: 'https://youtu.be/HQdimmkgMak',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InkWell buildSubTabItem(String title, VoidCallback onTap,
      {required bool selected}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected ? ThemeColors.darkBlueColor : null,

          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
