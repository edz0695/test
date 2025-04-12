import 'package:flutter/material.dart';

import '../../../../models/jobModel.dart';
import '../../../screens/navigationscreen/education/education_services/jobs/job_item.dart';


class SearchList extends StatelessWidget {
  SearchList({super.key});
  final jobList=Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => JobItem(
            job: jobList[index],
            showTime: true,
          ),
          separatorBuilder: (_, index) => const SizedBox(
            height: 15,
          ),
          itemCount: jobList.length),
    );
  }
}