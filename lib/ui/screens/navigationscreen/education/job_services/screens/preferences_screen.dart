import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/src/src.dart';
import 'build_resume_screen.dart';
import 'experience_screen.dart';
import 'see_jobs_screen.dart';

class Job {
  final String title;
  final String subtitle;
  final String id;

  Job(this.title, this.subtitle, this.id);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(json['title'], json['description'], json['id']);
  }
}

class JobPreferencesScreen extends StatefulWidget {
  final ResumeData resumeData;
  final Course selectedCourse;

  const JobPreferencesScreen(
      {super.key, required this.resumeData, required this.selectedCourse});

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
    String? token = prefs.getString('token');
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
          _selectedJobs = {for (var job in allJobs) job: false};
        });
      }
    } else {
      // Handle error
      printThis('Failed to load jobs');
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
      appBar: AppBar(
        title: StepProgressIndicator(),
        backgroundColor: ThemeColors.darkBlueColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColors.darkBlueColor,
            statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(
                '    BACK   ',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              )),
          ElevatedButton(
              onPressed: () => Get.to(
                    () => SeeJobsScreen(
                      resumeData: widget.resumeData,
                      selectedCourse: widget.selectedCourse,
                      selectedJobs: _selectedJobs,
                    ),
                  ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              child: Text(
                '  NEXT  ',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              height(10),
              Card(
                color: ThemeColors.backgroundLightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Get personalised job recommendations based on your experience.",
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                ),
              ),
              height(10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Select preferred department/area of work",
                    style: TextStyle(
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: "Search Jobs",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) => _filterJobs(value),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 8.0, left: 8),
                      child: Text(
                        "All Jobs",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ..._filteredJobs.map((job) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.work),
                            title: Text(
                              job.title,
                            ),
                            subtitle: Text(job.subtitle),
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
                            child: Divider(),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
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
