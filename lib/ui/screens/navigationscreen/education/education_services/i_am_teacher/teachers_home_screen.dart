import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/student_lead/students_leads.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/online_exam_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/tab_viewer_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/uploadVideos.dart';
import 'package:payapp/ui/widgets/box_button_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../shared_widgets/educate_yourself_banner.dart';
import '../../shared_widgets/find_service_search_bar.dart';
import '../../shared_widgets/tutors_carousel_banner.dart';
import '../community/community_home_screen.dart';

import '../single-chapter/singleSubject.dart';
import 'teacher_screens/editProfile.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen>
    with AutomaticKeepAliveClientMixin<TeacherHomeScreen> {
  final List<String> imgList = [
    'https://img.freepik.com/free-psd/e-learning-banner-template_23-2149113644.jpg',
    'https://img.freepik.com/free-psd/graphic-design-course-banner-template_23-2149109565.jpg',
    'https://img.freepik.com/free-psd/e-learning-banner-design-template_23-2149113592.jpg',
    'https://img.freepik.com/premium-vector/flat-design-e-learning-banner-design-template_488125-20.jpg',
  ];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EarnScreenProvider>(context, listen: false);
  }

  bool isClickPYQ = false;
  bool isClickChapter = false;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Hello Teacher',
        size: 55,
        fs: 22,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 5, right: 5),
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EducateYourselfBanner(educate: 'Educate our students'),
            const FindServiceSearchBar(),
            const SizedBox(height: 10),
            TutorsCarouselBanners(imgList: imgList),
            const SizedBox(height: 20),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (1 / 1.25),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/notes.png",
                  title: "Edit Profile ",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeacherInfoEdit()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/video-lesson.png",
                  title: "Live Class",
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/video.png",
                  title: "Homework",
                  onTap: () {
                    Get.to(
                      () => const TabViewerScreen(
                        viewerTitle: 'Homework',
                        viewerTab1: 'Students',
                        viewerTab2: 'Batches',
                      ),
                    );
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/community.png",
                  title: "Students leads",
                  onTap: () {
                    RouteConfig.navigateTo(context, const StudentLeads());
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/community.png",
                  title: "Community",
                  onTap: () {
                    RouteConfig.navigateTo(
                        context, const CommunityHomeScreen());
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/home.png",
                  title: "Online Exam",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnlineExamScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/elearning.png",
                  title: "Coupons",
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const TutorOnlineScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/mortarboard.png",
                  title: "Upload Videos",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadVideos()));
                  },
                ),
                // BoxButtonStudentWidget(
                //   pngIconPath: "assets/education/trophy.png",
                //   title: "Contests",
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const ContestsHomeScreen()));
                //   },
                // ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/answer.png",
                  title: "PYQ's",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingleSubject()));
                    // setState(() {
                    //   isClickPYQ = true;
                    // });
                    // Timer(Duration(milliseconds: 100), () {
                    //   scrollController.animateTo(scrollController.position.maxScrollExtent, duration:Duration(milliseconds: 500 ), curve: Curves.easeIn);
                    // });
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleSubject()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/cart.png",
                  title: "Attendance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabViewerScreen(
                          viewerTitle: 'Attendance',
                          viewerTab1: 'Students',
                          viewerTab2: 'Batches',
                        ),
                      ),
                    );
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartScreen()));
                  },
                ),
                BoxButtonStudentWidget(
                  pngIconPath: "assets/education/wishlist.png",
                  title: "wallet",
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyWishlistScreen()));
                  },
                ),

                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> SubjectScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset('assets/education/video-lesson.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)
                //         ),
                //         Text(
                //           'Video lecture',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/book.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Notes',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> SambhavtubeScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/play-round-icon.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Sambhav Tube',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> CommunityScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/community-svgrepo-com.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Community',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> TutorHomeScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/hometutor.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Home Tutors',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> TutorOnlineScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/hometutor.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Online Tutors',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> ScholorshipScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/scholarship-svgrepo-com.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Scholorships',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 100,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> OfflineCoachingsScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/hometutor.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Offline Coaching',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Contests()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/hometutor.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'Contests',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPyqScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/hometutor.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'PYQ\'s',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/cart-icon.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'My Cart',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(20),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyWishlistScreen()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //             child: SvgPicture.asset(
                //                 'assets/images/educationscreen/wishlist-icon.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,)),
                //         Text(
                //           'My Wishlist',
                //           style: TextStyle(
                //               fontSize: MediaQuery.of(context).size.width * 0.05,
                //               fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     height: 20,
                //     decoration: BoxDecoration(
                //         color: Colors.grey.withOpacity(0.1),
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBarTeacher(
        t1: 'Home',
        i1: Icons.home,
        t2: 'Wallet',
        i2: Icons.wallet,
        t3: 'Attendance',
        i3: Icons.people_alt_outlined,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CustomBottomNavigationBarTeacher extends StatelessWidget {
  const CustomBottomNavigationBarTeacher({
    super.key,
    this.t1,
    this.t2,
    this.t3,
    this.t4,
    this.i1,
    this.i2,
    this.i3,
    this.i4,
  });

  final String? t1;
  final String? t2;
  final String? t3;
  final String? t4;
  final IconData? i1;
  final IconData? i2;
  final IconData? i3;
  final IconData? i4;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: ThemeColors.backgroundLightBlue,
        ),
        child: Consumer<EarnScreenProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: ThemeColors.backgroundLightBlue,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.updateIndex(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(i1),
                  label: t1,
                ),
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(
                    i2,
                  ),
                  label: t2,
                ),
                BottomNavigationBarItem(
                  backgroundColor: ThemeColors.backgroundLightBlue,
                  icon: Icon(
                    i3,
                  ),
                  label: t3,
                ),
                if (t4 != null && i4 != null)
                  BottomNavigationBarItem(
                    backgroundColor: ThemeColors.backgroundLightBlue,
                    icon: Icon(
                      i4,
                    ),
                    label: t4,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
