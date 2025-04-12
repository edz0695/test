// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/education_services/contests/contest_awards_tab.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/education_services/contests/contest_participate_tab.dart';
// import 'package:payapp/ui/widgets/app_bar_widget.dart';

// import '../../../../../../core/components/tab_indicator.dart';
// import '../../../../../../themes/colors.dart';
// import 'contest_live_tab.dart';

// // import '../../;

// class ContestsHomeScreen extends StatefulWidget {
//   const ContestsHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<ContestsHomeScreen> createState() => _ContestsHomeScreenState();
// }

// class _ContestsHomeScreenState extends State<ContestsHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: const AppBarWidget(
//             title: "Contests",
//             size: 55,
//           ),
//           body: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         offset: const Offset(3, 3),
//                         color: const Color(0xff2057A6).withOpacity(0.2),
//                         blurRadius: 20.0,
//                       ),
//                     ],
//                   ),
//                   child: TabBar(
//                     tabs: const [
//                       Tab(
//                         text: "Live",
//                       ),
//                       Tab(
//                         child:Text("Participated",style: TextStyle(fontSize: 12),),
//                       ),
//                       Tab(
//                         text: "Awards",
//                       ),
//                     ],
//                     labelStyle: GoogleFonts.poppins(),
//                     labelColor: ThemeColors.primaryBlueColor,
//                     splashBorderRadius: BorderRadius.circular(10),
//                     indicator: const CvTabIndicator(
//                       indicatorHeight: 4,
//                       indicatorColor: ThemeColors.primaryBlueColor,
//                       indicatorSize: CvTabIndicatorSize.normal,
//                     ),
//                     indicatorSize: TabBarIndicatorSize.label,
//                     unselectedLabelColor: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Expanded(
//                   child: TabBarView(
//                     children: [
//                       ContestLiveTap(),
//                       ContestParticipateTab(),
//                       ContestAwardsTab(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
