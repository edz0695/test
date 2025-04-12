import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/scholarships/tabs_subtabs/rewards_tab.dart';
import '../../../../../../config/apiconfig.dart';
import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../core/components/tab_indicator.dart';
import '../../../../../../core/utils/helper/helper.dart';
import '../../../../../../models/scholorshipmodel.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';

class ScholarshipDetails extends StatefulWidget {
  final bool isEnroll;

  final ScholarshipModel schDetail;

  const ScholarshipDetails(
      {super.key, required this.schDetail, required this.isEnroll});

  @override
  State<ScholarshipDetails> createState() => _ScholarshipDetailsState();
}

class _ScholarshipDetailsState extends State<ScholarshipDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Scholarship Details", size: 55),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            'assets/education/top3win.jpg',
                            width: double.infinity,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(),
                              CircleAvatar(
                                radius: 25,
                              ),
                              CircleAvatar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3, 3),
                          color: const Color(0xff2057A6).withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: TabBar(
                      isScrollable: true,
                      tabs: const [
                        Tab(
                          child: Text(
                            "Rewards & Benefits",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Details",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Result",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Winners",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Offered By",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Video Details",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      labelStyle: GoogleFonts.poppins(),
                      labelColor: ThemeColors.primaryBlueColor,
                      splashBorderRadius: BorderRadius.circular(10),
                      indicator: const CvTabIndicator(
                        indicatorHeight: 4,
                        indicatorColor: Colors.transparent,
                        indicatorSize: CvTabIndicatorSize.normal,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        100, // Adjust the height as needed
                    child: const TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        RewardsTab(),
                        RewardsTab(),
                        RewardsTab(),
                        RewardsTab(),
                        RewardsTab(),
                        RewardsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: widget.isEnroll
          ? FloatingActionButton.extended(
              onPressed: () {
                Helper.showScaffold(context, "ShowForm");
              },
              label: Text(
                "      Enroll Now      ",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          : null,
    );
  }
}

class DetailsBanner extends StatelessWidget {
  const DetailsBanner({
    super.key,
    required this.widget,
  });

  final ScholarshipDetails widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: PageView.builder(
          itemCount: widget.schDetail.banner.length,
          itemBuilder: (context, index) {
            return Image.network(
              Constants.forImg + widget.schDetail.banner[index],
              fit: BoxFit.cover,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return const ShimmerAnimation();
              },
              errorBuilder: (context, error, stackTrace) => const Stack(
                alignment: Alignment.center,
                children: [
                  ShimmerAnimation(),
                  Text('Internet lost!'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
