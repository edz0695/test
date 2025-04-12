import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../themes/colors.dart';
import 'build_resume_screen.dart';
import 'experience_screen.dart';
import 'see_jobs_screen.dart';

class Job {
  final String title;
  final String subtitle;
  final String logo;
  final String id;


  Job(this.title, this.subtitle,this.logo,this.id);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(json['title'], json['description'],json['logo'],json['id']);
  }
}

class JobPreferencesScreen extends StatefulWidget {
  final ResumeData resumeData;
  final Course selectedCourse;
  const JobPreferencesScreen({super.key, required this.resumeData, required this.selectedCourse});

  @override
  State<JobPreferencesScreen> createState() => _JobPreferencesScreenState();
}

class _JobPreferencesScreenState extends State<JobPreferencesScreen> {
  int activeStep = 2;

  List<Job> allJobs = [];
  late List<Job> _filteredJobs;
  final TextEditingController _searchController = TextEditingController();
  Map<Job, bool> _selectedJobs = {};

  @override
  void initState() {
    super.initState();
    _fetchJobs();
    _filteredJobs = List.from(allJobs);
  }

  Future<void> _fetchJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth-token');
    if (token == null) {
      // Handle the case when there is no token
      return;
    }

    final response = await http.get(
      Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/departments'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        setState(() {
          allJobs = (data['data'] as List)
              .map((jobJson) => Job.fromJson(jobJson))
              .toList();
          _filteredJobs = List.from(allJobs);
          _selectedJobs = { for (var job in allJobs) job : false };
        });
      }
    } else {
      // Handle error
      print('Failed to load jobs');
    }
  }

  void _filterJobs(String query) {
    setState(() {
      _filteredJobs = allJobs.where((job) {
        return job.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 80,
                color: ThemeColors.primaryBlueColor,
                child: StepProgressIndicator()),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.grey,
              child: Text(
                "Get personalised job recommendations based on your experience.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color:Color(0xff184070) ,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Select preferred department/area of work",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:Color(0xff184070) ,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: "Search Jobs",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _filterJobs(value),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 12,right:12),
                    child: Text(
                      "All Jobs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:Color(0xff184070) ,
                      ),
                    ),
                  ),
                  ..._filteredJobs.map((job) {
                    return Column(
                      children: [
                        ListTile(
                          leading:Image.network(job.logo,height:30,width:30),
                          title: Text(
                            job.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:Color(0xff184070),
                            ),
                          ),
                          subtitle: Text(job.subtitle,  style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:Color(0xff184070),
                          ),),
                          trailing: Checkbox(
                            value: _selectedJobs[job],
                            onChanged: (value) {
                              setState(() {
                                _selectedJobs[job] = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color:Colors.grey.shade300
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ).copyWith(
                  backgroundColor:
                  WidgetStateProperty.resolveWith<Color>(
                        (states) => Colors.transparent,
                  ),
                  elevation: WidgetStateProperty.all(
                      0), // Remove button shadow
                ),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0xFF0080FF).withOpacity(0.7),width:1)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: 150,
                      minHeight: 50,
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Color(0xFF0080FF).withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width:15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SeeJobsScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) => Colors.transparent,
                  ),
                  elevation:
                  WidgetStateProperty.all(0), // Remove button shadow
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xFF0080FF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: 150,
                      minHeight: 50,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  const StepProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white),
          ),
          Expanded(
            child: Divider(color: Colors.blue, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white),
          ),
          Expanded(
            child: Divider(color: Colors.grey, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(
              '4',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
