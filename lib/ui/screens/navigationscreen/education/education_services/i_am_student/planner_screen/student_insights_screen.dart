import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:payapp/provider/education_providers/student_dashboard_provider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/planner_screen/tabs/progress_tab.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/planner_screen/tabs/schedule_tab.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/planner_screen/tabs/watchlist_tab.dart';
import 'package:provider/provider.dart';

import '../../../../../../../themes/icons_broken.dart';

class StudentInsightsScreen extends StatelessWidget {

  StudentInsightsScreen({super.key});
  int currentTaskIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StudentDashboardProvider(),
      child: Consumer<StudentDashboardProvider>(
        builder: (context, provider, child) {
          TextStyle tabsStyle = const TextStyle(
              fontSize: 12.0,
              color: ThemeColors.darkBlueColor,
              fontWeight: FontWeight.bold);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    floating: true,
                    leading: const Icon(
                      IconBroken.Bookmark,
                      color: ThemeColors.darkBlueColor,
                    ),
                    elevation: 5,
                    centerTitle: true,
                    title: const Text(
                      'Howdy, Julie',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          IconBroken.Edit_Square,
                          color: ThemeColors.darkBlueColor,
                        ),
                      ),
                    ],
                    expandedHeight: 300,
                    collapsedHeight: 300,
                    stretch: true,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/education/calender.png',
                                  height: 300,
                                ),
                                const Positioned(
                                  top: 90,
                                  child : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'October 2023',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          color: ThemeColors.darkBlueColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Friday',
                                        style: TextStyle(
                                          color: ThemeColors.darkBlueColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: TabBar(
                      automaticIndicatorColorAdjustment: false,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:  ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            style: BorderStyle.solid,
                            color: ThemeColors.darkBlueColor,
                            width: 4,
                            strokeAlign: 3,
                          ),
                        ),
                      ),
                      onTap: (index) {
                        provider.changeIndex(index);
                      },
                      physics: const BouncingScrollPhysics(),
                      dragStartBehavior: DragStartBehavior.start,
                      tabs: [

                        Tab(
                          icon: const Icon(
                            Icons.schedule_rounded,
                            color: ThemeColors.darkBlueColor,
                            size: 20,
                          ),
                          child: Text(
                            'Schedules',
                            style: tabsStyle,
                          ),
                        ),
                        Tab(
                          icon: const Icon(
                            Icons.add_chart,
                            color: ThemeColors.darkBlueColor,
                            size: 30,
                          ),
                          child: Text(
                            'Progress',
                            style: tabsStyle,
                          ),
                        ),
                        Tab(
                          icon: const Icon(
                            Icons.watch_later_outlined,
                            color: ThemeColors.darkBlueColor,
                            size: 30,
                          ),
                          child: Text(
                            'Watchlist',
                            style: tabsStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                body: TabBarView(
                  children: [
                    ScheduleTab(steps: steps),
                    const ProgressTab(),
                    const WatchlistTab(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
