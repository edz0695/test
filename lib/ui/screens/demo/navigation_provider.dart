import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/ca_home_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/earn_section/earn_main_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/educationform.dart';

class NavigationProvider extends ChangeNotifier {
  List<Widget> screens = [
    const Center(child: Text('Hello ')),
    const EarnMainScreen(),
    const CaServicesScreen(),
    const EducationFormScreen(),
  ];
  List<String> titles = [
    'Home',
    'Earn',
    'CA Services',
    'Education',
  ];

  int currentScreenIndex = 0;

  void changeCurrentScreen(int index) {
    currentScreenIndex = index;
    notifyListeners();
  }
}
