import 'package:flutter/material.dart';
import 'package:payapp/provider/education_providers/student_dashboard_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../themes/colors.dart';

class StudentsDashboard extends StatefulWidget {
  const StudentsDashboard({super.key});

  @override
  State<StudentsDashboard> createState() => _StudentsDashboardState();
}

class _StudentsDashboardState extends State<StudentsDashboard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StudentDashboardProvider(),
      child: Consumer<StudentDashboardProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            // appBar: const AppBarWidget(title: 'Dashboard',size: 55),
            body: IndexedStack(
              index: provider.currentIndex,
              children: provider.screens,
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(
              t1: 'Home',
              i1: Icons.home,
              t2: 'Insights',
              i2: Icons.map,
              t3: 'Courses',
              i3: Icons.cast_for_education,
              t4: 'Achievements',
              i4: Icons.star,
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
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
        child: Consumer<StudentDashboardProvider>(
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
                provider.changeIndex(index);
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
