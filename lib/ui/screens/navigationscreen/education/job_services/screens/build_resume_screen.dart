import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../../../src/src.dart';
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
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not available case
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var response = await http.get(
      Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/check/employe'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['data'] != null) {
        var resumeInfo = responseData['data'];
        resumeData = ResumeData(
          fullName: resumeInfo['name'],
          email: resumeInfo['email'],
          age: resumeInfo['age'],
          gender: resumeInfo['gender'],
          profilePicture: XFile(resumeInfo['logo']),
        );
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
        SnackBar(content: Text('Failed to check resume status.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ThemeColors.backgroundLightBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    back(),
                    width(Get.size.width * .17),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                        ),
                        child: resumeData.profilePicture == null
                            ? Icon(
                                Icons.person_outline,
                                size: 60,
                                color: Colors.white,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(
                                        File(resumeData.profilePicture!.path),
                                      ),
                                    )),
                              )),
                  ],
                ),
                Center(
                  child: TextButton(
                    onPressed: _pickImage,
                    child: Text(
                      resumeData.profilePicture == null
                          ? "Add Photo"
                          : "Change Photo",
                    ),
                  ),
                ),
                height(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's build your resume",
                      style: TextStyle(
                          color: ThemeColors.darkBlueColor,
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your details so that employers can find you easily for a job",
                      style: TextStyle(
                          color: ThemeColors.darkBlueColor,
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                height(25),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) => resumeData.fullName = value!,
                ),
                height(15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
                height(15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
                height(15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        color: ThemeColors.darkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                RadioListTile.adaptive(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Male'),
                  value: "male",
                  groupValue: resumeData.gender,
                  onChanged: (value) {
                    setState(() {
                      resumeData.gender = value!;
                    });
                  },
                ),
                RadioListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  title: const Text('Female'),
                  value: "female",
                  groupValue: resumeData.gender,
                  onChanged: (value) {
                    setState(() {
                      resumeData.gender = value!;
                    });
                  },
                ),
                height(20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
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
                      toast(
                          message:
                              'Please complete the form and select a profile picture.');
                    }
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
