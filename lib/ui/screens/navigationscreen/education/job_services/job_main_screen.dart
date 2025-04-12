import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/job_services/screens/build_resume_screen.dart';

class JobMainScreen extends StatefulWidget {
  const JobMainScreen({super.key});

  @override
  State<JobMainScreen> createState() => _JobMainScreenState();
}

class _JobMainScreenState extends State<JobMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BuildResumeScreen());
  }
}
