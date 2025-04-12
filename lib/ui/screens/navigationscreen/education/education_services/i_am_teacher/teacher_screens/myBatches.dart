import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/widgets/teacherBatchesForm.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/widgets/teacherbatches.dart';

import '../../../../../../../core/components/tab_indicator.dart';
import '../../../../../../../themes/colors.dart';
import '../../../../../../widgets/app_bar_widget.dart';

class MyBatches extends StatefulWidget {
  const MyBatches({super.key});

  @override
  State<MyBatches> createState() => _MyBatchesState();
}

class _MyBatchesState extends State<MyBatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "My Batches",
        size: 55,
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                      tabs: const [
                        Tab(
                          text: "My batches",
                        ),
                        Tab(
                          text: "Create Batch",
                        ),
                      ],
                      labelStyle: GoogleFonts.poppins(),
                      labelColor: ThemeColors.primaryBlueColor,
                      splashBorderRadius: BorderRadius.circular(10),
                      indicator: const CvTabIndicator(
                        indicatorHeight: 4,
                        indicatorColor: ThemeColors.primaryBlueColor,
                        indicatorSize: CvTabIndicatorSize.normal,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [TeacherBatches(), TeacherBatchesForm()],
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
