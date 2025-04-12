import 'package:flutter/material.dart';
import '../../../../../../widgets/app_bar_widget.dart';
import '../../../shared_widgets/build_teacher_card.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List _teachersProfile = [
    "https://www.pngall.com/wp-content/uploads/4/Male-Teacher-PNG-Picture.png",
    "https://www.pngall.com/wp-content/uploads/4/Female-Teacher-PNG-Free-Download.png",
    "https://cutewallpaper.org/24/teacher-png/teacher-6e753-png.png",
    "https://www.pngall.com/wp-content/uploads/4/Male-Teacher-PNG-Picture.png",
    "https://www.pngall.com/wp-content/uploads/4/Female-Teacher-PNG-Free-Download.png",
    "https://cutewallpaper.org/24/teacher-png/teacher-6e753-png.png",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: 'My Cart', size: 55),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const TutorsAndCoachingAppBar(screenTitle: 'Hired Teachers'),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: _teachersProfile.length,
                itemBuilder: (_, index) {
                  return BuildTeacherCard(
                    size: size,
                    title: "MAHFUZA KHAIRUN",
                    subTitle: "Computer Engineer",
                    image: _teachersProfile[index],
                    rating: '4',
                    // TODO: Add teacher ID
                    teacherId: "ADD ID",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
