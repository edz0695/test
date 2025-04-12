import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import '../../../../../../widgets/box_button_widget.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  final double progress = 75.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Achievements', size: 55),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Student name ' * 4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Student info ' * 4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress / 100,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: ThemeColors.darkBlueColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 7,
                      child: Text(
                        '${progress.toStringAsFixed(0)}%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (1 / 1.1),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  BoxButtonAchievement(
                    achieved: true,
                    pngIconPath: "assets/education/jee-main.png",
                    title: "Sambhav Scholarships",
                    onTap: () {},
                  ),
                  BoxButtonAchievement(
                    achieved: true,
                    pngIconPath: "assets/education/jee-advance.png",
                    title: "Sambhav Programs\nResults",
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesScreen()));
                    },
                  ),
                  BoxButtonAchievement(
                    achieved: true,
                    pngIconPath: "assets/education/wbjee.png",
                    title: "GOV Scholarships",
                    onTap: () {},
                  ),
                  BoxButtonAchievement(
                    achieved: true,
                    pngIconPath: "assets/education/wbjee.png",
                    title: "Government Results",
                    onTap: () {},
                  ),
                  BoxButtonAchievement(
                    pngIconPath: "assets/education/jee-main.png",
                    title: "Sambhav Scholarships",
                    onTap: () {},
                  ),
                  BoxButtonAchievement(
                    pngIconPath: "assets/education/jee-advance.png",
                    title: "Sambhav Programs\nResults",
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesScreen()));
                    },
                  ),
                  BoxButtonAchievement(
                    pngIconPath: "assets/education/jee-advance.png",
                    title: "Sambhav Programs\nResults",
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesScreen()));
                    },
                  ),
                  BoxButtonAchievement(
                    pngIconPath: "assets/education/wbjee.png",
                    title: "GOV Scholarships",
                    onTap: () {},
                  ),
                  BoxButtonAchievement(
                    pngIconPath: "assets/education/wbjee.png",
                    title: "GOV Scholarships",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxButtonAchievement extends StatelessWidget {
  final String title;
  final String pngIconPath;
  final Function()? onTap;
  final bool achieved;

  const BoxButtonAchievement({
    super.key,
    required this.title,
    required this.pngIconPath,
    this.onTap,
    this.achieved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      color: Colors.white,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.black.withOpacity(.08),
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: achieved
              ? Image.asset(
                  pngIconPath,
                  color: const Color(0xff2057A6),
                )
              : const Icon(
                  Icons.lock_clock,
                  size: 40,
                  color: Colors.blueGrey,
                ),
        ),
      ),
    );
  }
}
