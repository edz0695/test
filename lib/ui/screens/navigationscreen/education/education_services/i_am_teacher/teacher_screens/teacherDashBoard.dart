import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/myBatches.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/mylivebatches.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/student_lead/old_students_leads.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/tab_viewer_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/teacherProfileForm.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/messages/messages.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import '../widgets/gridIItemTile.dart';

class TeacherDashBoard extends StatefulWidget {
  const TeacherDashBoard({super.key});

  @override
  State<TeacherDashBoard> createState() => _TeacherDashBoardState();
}

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Teacher Dashboard",
        size: 55,
      ),
      body: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (1 / 1),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          GridItemTile(
            label: "Profile",
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const TeacherProfileForm()));
            },
          ),
          GridItemTile(
            label: "My batches",
            icon: Icons.document_scanner_outlined,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyBatches()));
            },
          ),
          GridItemTile(
            label: "Messages",
            icon: Icons.message,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyMessages()));
            },
          ),
          // GridItemTile(label: "Students leads",icon: Iconsax.user),
          GridItemTile(
            label: "Students leads",
            icon: Icons.child_care,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OldStudentLeads()));
            },
          ),
          GridItemTile(
            label: "Study materials",
            icon: Icons.document_scanner,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TabViewerScreen(
                            viewerTitle: 'Study Material',
                            viewerTab1: 'Students',
                            viewerTab2: 'Batches',
                          )));
            },
          ),
          GridItemTile(
            label: "Live",
            icon: Icons.live_tv,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyLiveBatches()));
            },
          ),
        ],
      ),
    );
  }
}
