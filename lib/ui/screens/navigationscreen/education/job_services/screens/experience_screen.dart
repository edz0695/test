import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payapp/ui/screens/navigationscreen/education/job_services/screens/preferences_screen.dart';
import '../../../../../../src/src.dart';
import 'build_resume_screen.dart';
import 'package:http/http.dart' as http;

class ExperienceScreen extends StatefulWidget {
  final ResumeData resumeData;

  const ExperienceScreen({super.key, required this.resumeData});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();

  List<Course> degreeCourses = [];
  List<Course> _filteredCourses = [];
  Course? _selectedCourse;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var response = await http.get(
          Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/qualification'),
          headers: {
            'Authorization': 'Bearer $token',
          });
      var data = jsonDecode(response.body)["data"];
      printThis(response.statusCode);
      printThis(response.body);
      if (response.statusCode == 200) {
        setState(() {
          degreeCourses =
              List<Course>.from(data.map((model) => Course.fromJson(model)));
          _filteredCourses = List.from(degreeCourses);
        });
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            height(20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Courses',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {
                    _filteredCourses = degreeCourses.where((course) {
                      return course.name
                          .toLowerCase()
                          .contains(value.toLowerCase());
                    }).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCourses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredCourses[index].name),
                    onTap: () {
                      _courseController.text = _filteredCourses[index].name;
                      setState(() {
                        _selectedCourse = _filteredCourses[index];
                      });
                      // You might want to store selected course ID somewhere
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
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
                    () => JobPreferencesScreen(
                      resumeData: widget.resumeData,
                      selectedCourse: _selectedCourse!,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: ThemeColors.backgroundLightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Providing your education details can give employers a better understanding of your strengths as a candidate",
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                ),
              ),
              height(20),
              Text(
                "What's your highest job qualification ?",
                style: TextStyle(
                    color: ThemeColors.darkBlueColor,
                    fontSize: Dimensions.fontSizeDefault,
                    fontWeight: FontWeight.bold),
              ),
              height(20),
              InkWell(
                onTap: () => _showBottomSheet(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: _courseController,
                    decoration: InputDecoration(
                      labelText: 'Select Degree Course',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Course {
  final String id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
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
            child: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey, thickness: 3),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
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
