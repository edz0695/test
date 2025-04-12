import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/job_services_2/screens/build_resume_screen.dart';
class JobMainScreen2 extends StatefulWidget {
  const JobMainScreen2({super.key});

  @override
  State<JobMainScreen2> createState() => _JobMainScreen2State();
}

class _JobMainScreen2State extends State<JobMainScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BuildResumeScreen());
  }
}
