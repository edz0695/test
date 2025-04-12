import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/achievements_screen/achievements_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/courses_screen/courses_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/student_education_home_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_student/planner_screen/student_insights_screen.dart';

class StudentDashboardProvider extends ChangeNotifier {
  int currentIndex = 0;
  int currentStepIndex = 0;

  List<Widget> plannerTitles = [
    const Text('Schedule'),
    const Text('Progress'),
    const Text('Watchlist'),
  ];

  void changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeStepIndex(index) {
    currentIndex = index;
    notifyListeners();
  }


  List<Widget> screens = [
    const StudentEducationHomeScreen(),
     StudentInsightsScreen(),
    const StudentsCoursesScreen(),
    const AchievementsScreen(),
  ];
}



