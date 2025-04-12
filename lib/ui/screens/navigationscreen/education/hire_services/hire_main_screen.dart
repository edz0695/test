import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_list_page.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_posting_screen.dart';
import 'components/hire_bottom_navbar.dart';

class HireMainScreen extends StatefulWidget {
  const HireMainScreen({super.key});

  @override
  State<HireMainScreen> createState() => _HireMainScreenState();
}

class _HireMainScreenState extends State<HireMainScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(JobPostingScreen()),
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        backgroundColor: ThemeColors.darkBlueColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Job List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      body: JobListPage(),
      bottomNavigationBar: HireBottomNavBar(),
    );
  }
}
