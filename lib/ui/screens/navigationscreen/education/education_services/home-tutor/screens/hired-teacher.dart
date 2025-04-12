import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/home-tutor/screens/single-teacher.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_widgets/tutors_and_coaching_bar.dart';
import '../../../../../../widgets/app_bar_widget.dart';
import '../../../shared_widgets/build_teacher_card.dart';

class HiredTeacher extends StatefulWidget {
  const HiredTeacher({super.key});

  @override
  State<HiredTeacher> createState() => _HiredTeacherState();
}

class _HiredTeacherState extends State<HiredTeacher> {
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
      appBar: const AppBarWidget(title: 'Hired Teachers', size: 55),
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
