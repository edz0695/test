import 'package:flutter/material.dart';
import '../../../../../widgets/search/widgets/myjobslist.dart';


class MyJobsList extends StatefulWidget {
  const MyJobsList({super.key});

  @override
  State<MyJobsList> createState() => _MyJobsListState();
}

class _MyJobsListState extends State<MyJobsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Jobs')),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(child: MyJobsListn()),
            ],
          )
        ],
      ),
    );
  }
}