import 'package:flutter/material.dart';

import 'package:payapp/ui/screens/navigationscreen/education/education_services/home-tutor/screens/single-teacher.dart';

import '../../../../../../../themes/colors.dart';
import '../../../shared_widgets/build_teacher_card.dart';
import '../../../shared_widgets/tutors_and_coaching_bar.dart';

class HomeTutorNearMe extends StatefulWidget {
  const HomeTutorNearMe({super.key});

  @override
  State<HomeTutorNearMe> createState() => _HomeTutorNearMeState();
}

class _HomeTutorNearMeState extends State<HomeTutorNearMe> {
  static const List<String> _teachersProfile = [
    "https://www.pngall.com/wp-content/uploads/4/Male-Teacher-PNG-Picture.png",
    "https://www.pngall.com/wp-content/uploads/4/Female-Teacher-PNG-Free-Download.png",
    "https://pngimg.com/d/teacher_PNG48.png",
    "https://www.freepnglogos.com/uploads/teacher-png/teacher-educomp-premium-bootstrap-html-template-28.png",
    "https://cutewallpaper.org/24/teacher-png/teacher-6e753-png.png",
    "https://www.pngall.com/wp-content/uploads/4/Male-Teacher-PNG-Picture.png",
    "https://www.pngall.com/wp-content/uploads/4/Female-Teacher-PNG-Free-Download.png",
    "https://pngimg.com/d/teacher_PNG48.png",
    "https://www.freepnglogos.com/uploads/teacher-png/teacher-educomp-premium-bootstrap-html-template-28.png",
    "https://cutewallpaper.org/24/teacher-png/teacher-6e753-png.png",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TutorsAndCoachingAppBar(screenTitle: 'Find teacher'),
              const SizedBox(height: 10),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: ThemeColors.primaryBlueColor.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1),
                  ],
                ),
                child: TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Select Location",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              ///TODO: Need dropdown for destination, but not much time to do this. when start developing. then do it.
              Row(
                children: [
                  SizedBox(
                    width: size.width * .60,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              color:
                                  ThemeColors.primaryBlueColor.withOpacity(0.1),
                              blurRadius: 5.0,
                              spreadRadius: 1),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search Teacher's",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              color:
                                  ThemeColors.primaryBlueColor.withOpacity(0.1),
                              blurRadius: 5.0,
                              spreadRadius: 1),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "1km",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: _teachersProfile.length,
                itemBuilder: (_, index) {
                  return BuildTeacherCard(
                    size: size,
                    title: "MAHFUZA KHAIRUN",
                    subTitle: "Computer Engineer",
                    image: _teachersProfile[index],
                    rating: '4.5',
                    // TODO: Add teacher ID
                    teacherId: "ADD ID",
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
