import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/ui/screens/navigationscreen/education/shared_screens/find_teacher_screen.dart';
import '../education_services/home-tutor/screens/batches_screen.dart';
import '../education_services/home-tutor/screens/hired-teacher.dart';
import '../education_services/home-tutor/screens/home-tuter-msg.dart';
import '../education_services/home-tutor/screens/homeWork.dart';
import '../education_services/home-tutor/screens/wishlist.dart';
import 'tutor_type_widget_builder.dart';

class TutorsCategoriesBuilder extends StatelessWidget {
  const TutorsCategoriesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tutorTypeWidget(
                label: "Hired Teachers",
                image: "assets/education/hire.png",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HiredTeacher())),
              ),
              const SizedBox(
                width: 20,
              ),
              tutorTypeWidget(
                label: "My Wishlist",
                image: "assets/education/wishlist.png",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WishListHomeTutor())),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tutorTypeWidget(
                label: "Messages",
                image: "assets/education/msg.png",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeTutorMsg())),
              ),
              const SizedBox(
                width: 20,
              ),
              tutorTypeWidget(
                label: "Teachers Near Me",
                image: "assets/education/near-me.png",
                onTap: () => Get.to(() => const FindTeacherScreen()),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tutorTypeWidget(
                label: "Batches",
                image: "assets/education/batch.png",
                onTap: () => Get.to(() => const BatchesScreen(
                      viewerTitle: 'Batches',
                      viewerTab1: 'Students',
                      viewerTab2: 'Batches',
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              tutorTypeWidget(
                label: "Submit Homework",
                image: "assets/education/homework.png",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeWork())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
