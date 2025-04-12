import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/job_services_2/screens/build_resume_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/job_services_2/screens/preferences_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../themes/colors.dart';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
      String? token = prefs.getString('auth-token');
      var response = await http.get(
          Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/qualification'),
          headers: {
            'Authorization': 'Bearer $token',
          });
      var data = jsonDecode(response.body)["data"];
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Courses',
                  border: OutlineInputBorder(),
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
                "Providing your education details can give employers a better understanding of your strengths as a candidate",
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
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12,vertical:12),
             child: Column(
               children: [
                 Text(
                   "What's your highest job qualification ?",
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     color:Color(0xff184070) ,
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: GestureDetector(
                     onTap: () => _showBottomSheet(context),
                     // Show bottom sheet on tap
                     child: AbsorbPointer(
                       child: TextField(
                         controller: _courseController,
                         // Main text field showing selected course
                         decoration: InputDecoration(
                           labelText: 'Select Degree Course',
                           border: OutlineInputBorder(),
                         ),
                       ),
                     ),
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
                         builder: (context) => JobPreferencesScreen(
                           resumeData: widget.resumeData,
                           selectedCourse: _selectedCourse!,
                         ),
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
               ],),
           )
          ],
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
