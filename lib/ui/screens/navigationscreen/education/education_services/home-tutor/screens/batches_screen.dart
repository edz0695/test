import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../../../core/components/tab_indicator.dart';
import '../../../../../../../themes/colors.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../../../dialogs/loaderdialog.dart';

class BatchesScreen extends StatelessWidget {
  const BatchesScreen(
      {super.key,
      required this.viewerTitle,
      required this.viewerTab1,
      required this.viewerTab2});

  final String viewerTitle;
  final String viewerTab1;
  final String viewerTab2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBarWidget(
            title: viewerTitle,
            size: 55,
          ),
          body: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3, 3),
                        color: const Color(0xff2057A6).withOpacity(0.2),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: viewerTab1,
                      ),
                      Tab(
                        text: viewerTab2,
                      ),
                    ],
                    labelStyle: GoogleFonts.poppins(),
                    labelColor: ThemeColors.primaryBlueColor,
                    splashBorderRadius: BorderRadius.circular(10),
                    indicator: const CvTabIndicator(
                      indicatorHeight: 4,
                      indicatorColor: ThemeColors.primaryBlueColor,
                      indicatorSize: CvTabIndicatorSize.normal,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      StudyMaterialForStudentsTab(),
                      StudyMaterialForStudentsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class StudyMaterialForStudentsTab extends StatefulWidget {
  const StudyMaterialForStudentsTab({super.key});

  static const List<String> images = [
    'https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg',
    "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
    'https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg',
    "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
    "https://www.nsba.org/-/media/ASBJ/2021/February/features/diverse-teachers-matter.jpg",
    "https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg",
    'https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg',
    "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
    'https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg',
    "https://lh3.googleusercontent.com/n6-Hpe8OulMNy2a_yH0QHRN_TCJUSry7nb8ciKLea1qwrpDmMRYb6OwhVjm8HkC08CulG2akijNO5Oo5O1MBBQ=s1500-pp",
    "https://www.nsba.org/-/media/ASBJ/2021/February/features/diverse-teachers-matter.jpg",
    "https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg",
  ];

  @override
  State<StudyMaterialForStudentsTab> createState() =>
      _StudyMaterialForStudentsTabState();
}

class _StudyMaterialForStudentsTabState
    extends State<StudyMaterialForStudentsTab> {
  bool isLoading = true;

  List students = [];

  Future<void> _fetchStudents() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token');
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/my/students');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var responseData = decodedResponse["data"];
        setState(() {
          students = responseData;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error calling API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loading()
        : ListView.separated(
            itemCount: students.length,
            itemBuilder: (context, index) => Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        students[index]['logo'] ??
                            'https://resilienteducator.com/wp-content/uploads/2014/11/math-teacher.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        students[index]['name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 5),
                      // Text(
                      //   'Tounge',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  )),
                  SizedBox(
                    width: 70,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.blue[900],
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeworkAssign(
                              createdBy: 'testing',
                              studentId: 'testing',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Assign',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
  }
}

class HomeworkAssign extends StatefulWidget {
  final String createdBy;
  final String studentId;

  const HomeworkAssign({
    required this.createdBy,
    required this.studentId,
    super.key,
  });

  @override
  _HomeworkAssignState createState() => _HomeworkAssignState();
}

class _HomeworkAssignState extends State<HomeworkAssign> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'createdBy': '',
    'student_id': '',
    'title': '',
    'assigned_date': '',
    'last_submission_date': '',
    'texthomework': '',
    'questions': [],
  };

  final List<Map<String, dynamic>> _questions = [];

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate(String field) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _formData[field] = _formatDate(pickedDate);
      });
    }
  }

  void _addQuestion() {
    setState(() {
      _questions.add({
        'SN': (_questions.length + 1).toString(),
        'question': '',
        'file': null,
        'question_file_title': '',
      });
    });
  }

  void _removeQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
      _questions.asMap().forEach((index, question) {
        question['SN'] = (index + 1).toString();
      });
    });
  }

  Future<String?> uploadImage(
      File imageFile, String uploadUrl, String userToken) async {
    final mimeTypeData = imageFile.path.split('/');

    final imageUploadRequest =
        http.MultipartRequest('POST', Uri.parse(uploadUrl));

    imageUploadRequest.headers['Authorization'] = 'Bearer $userToken';

    final file = await http.MultipartFile.fromPath(
      'media',
      imageFile.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
    );

    imageUploadRequest.files.add(file);

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        String? url = jsonDecode(response.body)["url"];
        return url;
      } else {
        print('Upload failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<void> _pickFiles(Map<String, dynamic> question) async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    String userToken = '';
    Future<void> loadToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        userToken = prefs.getString('auth-token') ?? '';
        print("UserToken Hey $userToken");
      });
    }

    await loadToken();
    if (result != null) {
      final file = File(result.path);
      var url = await uploadImage(
          file, 'https://xyzabc.sambhavapps.com/v1/media/uploads', userToken);

      setState(() {
        question['file'] = url;
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formData['questions'] = _questions;
      _formData['createdBy'] = widget.createdBy;
      _formData['student_id'] = widget.studentId;

      for (var question in _questions) {
        if (question['file'] == null) {
          // If any question does not have a file, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a file for all questions.'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }
      String userToken = '';
      Future<void> loadToken() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          userToken = prefs.getString('token') ?? '';
          print("UserToken Hey $userToken");
        });
      }

      await loadToken();
      var response = await http.post(
        Uri.parse(
            'https://xyzabc.sambhavapps.com/v1/education/student/hometutor/homework/submit'),
        // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode(_formData),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then parse the JSON.
        print('Homework uploaded successfully');

        print(response.body);
      } else {
        print(response.body);
        // If the server returns an unexpected response, then throw an exception.
        throw Exception('Failed to upload homework');
      }
    }
  }

  Future<void> _upload(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Uploading...'),
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text('Please wait')
            ],
          ),
        );
      },
    );
    _submitForm();
    // // Simulate a delay for the upload process
    // await Future.delayed(Duration(seconds: 3));

    // Pop the loading dialog
    Navigator.of(context).pop();

    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Complete'),
          content: const Text('Your upload was successful!'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Assign Homework',
        size: 55,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Hide 'Created By' and 'Student ID' fields from UI
            const SizedBox(height: 0, width: 0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the title';
                }
                return null;
              },
              onSaved: (value) {
                _formData['title'] = value!;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Assigned Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the assigned date';
                      }
                      return null;
                    },
                    controller:
                        TextEditingController(text: _formData['assigned_date']),
                    readOnly: true,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate('assigned_date'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Submission Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the last submission date';
                      }
                      return null;
                    },
                    controller: TextEditingController(
                        text: _formData['last_submission_date']),
                    readOnly: true,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate('last_submission_date'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Homework Text',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the homework text';
                }
                return null;
              },
              onSaved: (value) {
                _formData['texthomework'] = value!;
              },
            ),

            for (var question in _questions.asMap().entries)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Question ${question.key + 1}'),
                            IconButton(
                              icon: const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 19.5,
                                ),
                              ),
                              onPressed: () => _removeQuestion(question.key),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Question Text',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the question text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _questions[question.key]['question'] = value!;
                          },
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            elevation: 3,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          child: const Text('Select File'),
                          onPressed: () => _pickFiles(question.value),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                elevation: 3,
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: _addQuestion,
              child: const Text('Add Question'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: ThemeColors.darkBlueColor,
                elevation: 3,
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Assign Homework'),
              onPressed: () {
                _upload(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
