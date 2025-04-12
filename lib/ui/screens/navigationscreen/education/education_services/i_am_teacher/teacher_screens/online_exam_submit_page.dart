import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/components/tab_indicator.dart';
import '../../../../../../../src/src.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SelectStudentForExamScreen extends StatelessWidget {
  const SelectStudentForExamScreen(
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
                        color: const Color(0xff2057A6).withValues(alpha: 0.2),
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
                    unselectedLabelStyle:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    labelStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    dividerColor: Colors.transparent,
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
      print(token);
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
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Padding(
                padding: const EdgeInsets.all(7),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              student['logo'] ??
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
                              student['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Consumer<LoginSignUpProvider>(
                            builder: (context, user, child) => TextButton(
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
                                  onPressed: () =>
                                      Get.to(() => SubmitOnlineExamAssign(
                                            createdBy: user.userModel?.id ?? '',
                                            studentId: student["id"],
                                          )),
                                  child: const Text(
                                    'Assign',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
  }
}

class SubmitOnlineExamAssign extends StatefulWidget {
  final String createdBy;
  final String studentId;

  const SubmitOnlineExamAssign({
    required this.createdBy,
    required this.studentId,
    super.key,
  });

  @override
  _SubmitOnlineExamAssignState createState() => _SubmitOnlineExamAssignState();
}

class _SubmitOnlineExamAssignState extends State<SubmitOnlineExamAssign> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {
    'created_by': '',
    'student': '',
    'type': '',
    'questions': [],
  };

  final List<Map<String, dynamic>> _questions = [
    {
      'SN': '1',
      'question': '',
      'all_answer': [],
      'correct_answer': '',
      'question_image': null,
    },
  ];

  final List _options = [];

  void _addQuestion() {
    setState(() {
      _questions.add({
        'SN': (_questions.length + 1).toString(),
        'question': null,
        'all_answer': [],
        'correct_answer': '',
        'question_image': null,
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

  // Function to handle file upload for each question
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
        printThis('Upload failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      printThis('Error: $e');
    }
    return null;
  }

  // Picking files for each question and uploading them
  Future<void> _pickFiles(Map<String, dynamic> question) async {
    final result = await ImagePicker().pickMedia();
    String userToken = '';

    // Load the token asynchronously
    Future<void> loadToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        userToken = prefs.getString('auth-token') ?? '';
        printThis("UserToken Hey $userToken");
      });
    }

    await loadToken();

    if (result != null) {
      final file = File(result.path);

      // Upload the image asynchronously and wait for the URL to be returned
      var url = await uploadImage(
          file, 'https://xyzabc.sambhavapps.com/v1/media/uploads', userToken);

      if (url != null) {
        setState(() {
          question["question_image"] = url;
        });
      }
    } else {
      printThis("No file selected");
    }
  }

  // Submit the form after ensuring all files are uploaded
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _formData['created_by'] = widget.createdBy;
      _formData['student'] = widget.studentId;

      _formData['questions'] = [];

      for (var question in _questions) {
        _formData['questions'].add({
          'question': question['question'],
          'question_image': question['question_image'],
          'all_answer': _options,
          'correct_answer': question['correct_answer'],
        });
      }

      // for (var question in _questions) {
      //   if (question['file'] == null ||
      //       question['question'] == null ||
      //       question['question'] == '') {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Please select a file for all questions.'),
      //         backgroundColor: Colors.red,
      //       ),
      //     );
      //     return;
      //   }
      // }

      String userToken = '';
      Future<void> loadToken() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          userToken = prefs.getString('token') ?? '';
          print("UserToken Hey $userToken");
        });
      }

      await loadToken();

      // Send the form data to the server
      var response = await http.post(
        Uri.parse('https://xyzabc.sambhavapps.com/v1/exam/test'),
        headers: {
          'Authorization': 'Bearer $userToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_formData),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then parse the JSON.
        print('Test uploaded successfully');
        print("Test Assigned ${response.body}");
      } else {
        print(response.body);
      }
    }
  }

  // Function to show the uploading progress
  Future<void> _upload(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
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
    await _submitForm();
    print('QUESTIONS $_questions');
    print('JSON $_formData');
    Navigator.of(context).pop();

    // Show success dialog
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload Complete'),
          content: Text('Your upload was successful!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // _formData.clear();
                // _questions.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final type = ["Normal", "Quiz"];
  String examType = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Assign Test',
        size: 55,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            DropdownButtonFormField(
                padding: EdgeInsets.symmetric(vertical: 16),
                dropdownColor: ThemeColors.backgroundLightBlue,
                decoration: InputDecoration(
                    hintText: "Select Exam Type...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                items: type
                    .map((i) => DropdownMenuItem(value: i, child: Text(i)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _formData["type"] = value.toString())),
            for (var question in _questions.asMap().entries)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Question ${question.key + 1}'),
                            IconButton(
                              icon: CircleAvatar(
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
                        height(8),
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
                            onFieldSubmitted: (value) {
                              setState(() {
                                question.value["question"] = value;
                              });
                            }),
                        height(20),
                        SizedBox(
                          height: Get.size.height * .37,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => height(20),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  TextFormField(
                                      textInputAction: index == 3
                                          ? TextInputAction.done
                                          : TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText: 'Option ${index + 1}',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the question text';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) =>
                                          setState(() => _options.add(value))),
                                ],
                              );
                            },
                          ),
                        ),
                        height(20),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Correct answer',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the question text';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                question.value["correct_answer"] = value;
                              });
                            }),
                        height(20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            elevation: 3,
                            textStyle: TextStyle(fontSize: 16),
                          ),
                          child: Text('Select File'),
                          onPressed: () => _pickFiles(question.value),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            height(30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                elevation: 3,
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: _addQuestion,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Add Question'),
              ),
            ),
            height(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: ThemeColors.darkBlueColor,
                elevation: 3,
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Assign Test'),
              ),
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
