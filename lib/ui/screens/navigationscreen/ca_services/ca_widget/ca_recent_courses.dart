import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../themes/colors.dart';
import '../screens/ca_recent_courses_screen.dart';

class CaRecentCourses extends StatefulWidget {
  const CaRecentCourses({super.key});

  @override
  State<CaRecentCourses> createState() => _CaRecentCoursesState();
}

class _CaRecentCoursesState extends State<CaRecentCourses> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Recent Courses ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  Feedback.forTap(context);
                  Get.to(() => TrainingScreen());
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: ThemeColors.darkBlueColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 180,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Learn and Earn with m, Demat Account",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                      )
                    ],
                  )),
            );
          },
        ),
      )
    ]);
  }
}
