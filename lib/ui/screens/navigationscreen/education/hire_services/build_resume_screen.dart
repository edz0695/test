import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../../src/src.dart';
import 'hire_main_screen.dart';

class RecruiterBuildResumeScreen extends StatefulWidget {
  const RecruiterBuildResumeScreen({super.key});

  @override
  State<RecruiterBuildResumeScreen> createState() =>
      _RecruiterBuildResumeScreenState();
}

class RecruiterResumeData {
  String firstName;
  String lastName;
  String email;
  String position;
  String userId;
  XFile? profilePicture;

  RecruiterResumeData({
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.position = '',
    this.profilePicture,
  });
}

class _RecruiterBuildResumeScreenState
    extends State<RecruiterBuildResumeScreen> {
  final _formKey = GlobalKey<FormState>();
  RecruiterResumeData resumeData = RecruiterResumeData();
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
      Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/check/recruiter'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['data'] != null) {
        var resumeInfo = responseData['data'];
        resumeData = RecruiterResumeData(
          firstName: resumeInfo['first_name'].toString(),
          lastName: resumeInfo['last_name'].toString(),
          email: resumeInfo['email'],
          position: resumeInfo['position'],
          userId: resumeInfo['user_id'],
          profilePicture: XFile(resumeInfo['logo']),
        );
        Get.offAll(() => HireMainScreen());
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
      toast(message: 'Failed to check resume status.');
    }
  }

  bool isLoading = false;

  Future<void> registerRecruiter(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    setState(() => isLoading = true);
    if (token != null) {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://xyzabc.sambhavapps.com/v1/media/uploads'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath(
          'media', resumeData.profilePicture!.path));

      final res = await request.send();

      if (res.statusCode == 200) {
        final responseData = await res.stream.bytesToString();
        final responseJson = jsonDecode(responseData);

        var data = {
          "logo": responseJson['url'],
          "first_name": resumeData.firstName,
          "last_name": resumeData.lastName,
          "email": resumeData.email,
          "position": resumeData.position,
          "user_id": uid
        };

        printThis("JSON $data");
        var response = await http.post(
          Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/recruiter'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 200) {
          Get.offAll(() => HireMainScreen());
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
          printThis(response.statusCode);

          printThis(response.body);
        }
      } else {
        setState(() => isLoading = false);
        printThis(await res.stream.bytesToString());
        printThis(res.statusCode);
        toast(message: 'Failed to upload image.');
      }
    } else {
      setState(() => isLoading = false);
      toast(message: 'User token not found. Please log in again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: loading());
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
                      "Let's build your recruiter resume",
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
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) => resumeData.firstName = value!,
                ),
                height(15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) => resumeData.lastName = value!,
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
                  decoration: InputDecoration(
                    hintText: 'Position',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your position';
                    }
                    return null;
                  },
                  onSaved: (value) => resumeData.position = value!,
                ),
                height(20),
                Consumer<LoginSignUpProvider>(
                  builder: (context, user, child) => isLoading == false
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.indigo),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                resumeData.profilePicture != null) {
                              _formKey.currentState!.save();
                              registerRecruiter(user.userModel!.id);
                            } else {
                              toast(
                                  message:
                                      'Please complete the form and select a profile picture.');
                            }
                          },
                          child: Text(
                            'UPLOAD',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                      : loading(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
