import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/data.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/community/community_home_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/jobs/jobScreen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/my_wishlist/my_wishlist_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/offlinecoachings/offline_coaching_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/online_tutor/online_tutor_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/sambhavtube/sambhavtube.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/scholarships/scholarship_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/single-chapter/singleSubject.dart';
import 'package:payapp/ui/widgets/box_button_widget.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../shared_widgets/educate_yourself_banner.dart';
import '../../shared_widgets/find_service_search_bar.dart';
import '../../shared_widgets/tutors_carousel_banner.dart';
import '../cartwishlist/tabs/mycartscreen.dart';
import '../contests/widgets/contests_tile.dart';
import '../home-tutor/home-tutor.dart';
import '../notes/widgets/select_class_list.dart';
import '../video_lessons/view_lecture_subject.dart';

class StudentEducationHomeScreen extends StatefulWidget {
  const StudentEducationHomeScreen({super.key});

  @override
  State<StudentEducationHomeScreen> createState() =>
      _StudentEducationHomeScreenState();
}

class _StudentEducationHomeScreenState extends State<StudentEducationHomeScreen>
    with AutomaticKeepAliveClientMixin<StudentEducationHomeScreen> {
  final List<String> imgList = [
    'https://img.freepik.com/free-psd/e-learning-banner-template_23-2149113644.jpg',
    'https://img.freepik.com/free-psd/graphic-design-course-banner-template_23-2149109565.jpg',
    'https://img.freepik.com/free-psd/e-learning-banner-design-template_23-2149113592.jpg',
    'https://img.freepik.com/premium-vector/flat-design-e-learning-banner-design-template_488125-20.jpg',
  ];

  @override
  void dispose() {
    super.dispose();
  }

  bool isClickPYQ = false;
  bool isClickChapter = false;
  final scrollController = ScrollController();

  void openBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        // This is important
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: screenHeight * .73,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Select Your Class',
                          style: TextStyle(
                            color: ThemeColors.darkBlueColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SelectClassesList(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Hello ${currentUser.username}',
        size: 55,
        fs: 22,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EducateYourselfBanner(educate: 'Educate yourself'),
          const FindServiceSearchBar(),
          const SizedBox(height: 10),
          TutorsCarouselBanners(imgList: imgList),
          const SizedBox(height: 20),
          SizedBox(
            height: Get.size.height * .48,
            child: GridView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (1 / 1.25),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: [
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/video-lesson.png",
                  title: "Video Lesson",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllVideoSubjects()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/notes.png",
                  title: "Notes",
                  onTap: () {
                    openBottomSheet(context);
                  },
                ),
                // BoxButtonStudentWidget(
                //   pngIconPath: "assets/education/notes.png",
                //   title: "Personal Development",
                //   onTap: () {
                //     RouteConfig.navigateTo(context, PersonalDevelopment());
                //   },
                // ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/video.png",
                  title: "Sambhav Tube",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SambhavtubeScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/community.png",
                  title: "Community",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CommunityHomeScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/home.png",
                  title: "Home Tutor",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeTutor()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/elearning.png",
                  title: "Online Tutor",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorOnlineScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/mortarboard.png",
                  title: "Scholarships",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScholarshipScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/instructor.png",
                  title: "Offline Coaching",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const OfflineCoachingScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/trophy.png",
                  title: "Contests",
                  onTap: () => Get.to(() => ContestsTile()),
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/answer.png",
                  title: "PYQ's",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingleSubject()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/cart.png",
                  title: "My Cart",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCartScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/wishlist.png",
                  title: "My Wishlist",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWishlistScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/wishlist.png",
                  title: "Job",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// SambBNB(
// size: size,
// navStream: navStream,
// page1: "Home",
// icon1: Iconsax.home,
// page2: "Planner",
// icon2: Iconsax.map,
// page3: "Courses",
// icon3: Icons.cast_for_education,
// page4: "Achievements",
// icon4: Iconsax.medal_star,
// page1Tap: () {},
// page2Tap: () {},
// page3Tap: () {},
// page4Tap: () {},
// ),
