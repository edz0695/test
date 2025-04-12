import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/i_am_teacher/teacher_screens/tab_viewer_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/glass_effect.dart';

import 'online_exam_submit_page.dart';

class OnlineExamScreen extends StatefulWidget {
  const OnlineExamScreen({super.key});

  @override
  State<OnlineExamScreen> createState() => _OnlineExamScreenState();
}

class _OnlineExamScreenState extends State<OnlineExamScreen> {
  bool expanded = false;

  void changeExp() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Online Exam', size: 50),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TestActionWidget(
              actionName: 'Create Test',
              lottieName: 'assets/lottie/create_test.json',
              onTap: () {
                RouteConfig.navigateToRTL(
                    context,
                    const SelectStudentForExamScreen(
                        viewerTitle: 'Create Test',
                        viewerTab1: 'Students',
                        viewerTab2: 'Batches'));
              },
            ),
            const SizedBox(height: 40),
            TestActionWidget(
              actionName: 'Declare Results',
              lottieName: 'assets/lottie/declare_results.json',
              onTap: () {
                RouteConfig.navigateToRTL(
                    context,
                    const TabViewerScreen(
                        viewerTitle: 'Declare Results',
                        viewerTab1: 'Students',
                        viewerTab2: 'Batches'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TestActionWidget extends StatelessWidget {
  const TestActionWidget({
    super.key,
    required this.actionName,
    required this.lottieName,
    required this.onTap,
  });

  final String actionName;
  final String lottieName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GlassEffectedContainer(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              lottieName,
              width: 150,
              height: 150,
            ),
            Text(
              actionName,
              style: const TextStyle(
                color: ThemeColors.bluePrise,
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
