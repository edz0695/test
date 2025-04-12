import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/themes/colors.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../job_services/screens/jobs_search_screen.dart';
import 'experience_screen.dart';

class BuildResumeScreen extends StatefulWidget {
  const BuildResumeScreen({super.key});

  @override
  State<BuildResumeScreen> createState() => _BuildResumeScreenState();
}

class ResumeData {
  String fullName;
  String email;
  String age;
  String gender;
  XFile? profilePicture;

  ResumeData({
    this.fullName = '',
    this.email = '',
    this.age = '',
    this.gender = 'male',
    this.profilePicture,
  });
}

class _BuildResumeScreenState extends State<BuildResumeScreen> {
  final _formKey = GlobalKey<FormState>();
  ResumeData resumeData = ResumeData();
  bool _isLoading = true; // Add a loading state

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _checkResumeStatus(); // Check resume status on init
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        resumeData.profilePicture = image;
      });
    }
  }

  Future<void> _checkResumeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth-token');

    if (token == null) {
      // Handle token not available case
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var response = await http.get(
      Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/job/privatejobagainstdegree1/employe'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.body);

    var responseData = jsonDecode(response.body);


    if (responseData["data"].length != 0) {
      if (responseData['data']["name"] != null) {
        print("Printing Response Data");
        print(responseData);
        var resumeInfo = responseData['data'];

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => JobSearchScreen(),
        ));
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // Handle error case
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get resume status.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    "Let's build your resume",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Enter your details so that employers can find you easily for a job",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 45),
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade300,
                        ),
                        child: resumeData.profilePicture == null
                            ? const Center(child: Icon(Icons.person_outline, size: 40))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  File(resumeData.profilePicture!.path),
                                  height: 140,
                                  width: 140,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        resumeData.profilePicture == null?  'Add Photo':'Change Photo',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:Color(0xff184070) ,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                       contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        hintStyle: TextStyle(decoration: TextDecoration.none, color: Color(0xff184070),fontSize: 12, fontWeight: FontWeight.w400),
                       border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        // decoration: TextDecoration.none,
                        color:  Color(0xff184070),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      onSaved: (value) => resumeData.fullName = value!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        hintStyle: TextStyle(decoration: TextDecoration.none, color: Color(0xff184070),fontSize: 12, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        // decoration: TextDecoration.none,
                        color:  Color(0xff184070),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) => resumeData.email = value!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                         BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Age',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        hintStyle: TextStyle(decoration: TextDecoration.none, color: Color(0xff184070),fontSize: 12, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        // decoration: TextDecoration.none,
                        color:  Color(0xff184070),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                      onSaved: (value) => resumeData.age = value!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:Color(0xff184070) ,
                    ),
                  ),
                  ListTile(
                    title: const Text('Male'),
                    leading: Radio<String>(
                      value: "male",
                      groupValue: resumeData.gender,
                      onChanged: (value) {
                        setState(() {
                          resumeData.gender = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio<String>(
                      value: "female",
                      groupValue: resumeData.gender,
                      onChanged: (value) {
                        setState(() {
                          resumeData.gender = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          resumeData.profilePicture != null) {
                        _formKey.currentState!.save();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ExperienceScreen(
                                resumeData: resumeData,
                              )),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please complete the form and select a profile picture.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 52,
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
