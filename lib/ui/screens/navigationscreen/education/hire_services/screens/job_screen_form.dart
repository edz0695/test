import 'package:get/get.dart';
import 'package:payapp/src/src.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/additional_details_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_description_screen.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_posting_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:http/http.dart' as http;

class JobScreenForm extends StatefulWidget {
  final JobDescriptionData jobDescriptionData;
  final JobPostingData jobPostingData;
  const JobScreenForm(
      {super.key,
      required this.jobDescriptionData,
      required this.jobPostingData});
  @override
  _JobScreenFormState createState() => _JobScreenFormState();
}

class _JobScreenFormState extends State<JobScreenForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _recruiterNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _jobRoleController = TextEditingController();
  final TextEditingController _minExperienceController =
      TextEditingController();
  final TextEditingController _maxExperienceController =
      TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _totalExperienceController =
      TextEditingController();

  TimeOfDay? _interviewTime;
  TimeOfDay? _workTime;

  @override
  void dispose() {
    _companyNameController.dispose();
    _recruiterNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyAddressController.dispose();
    _jobRoleController.dispose();
    _totalExperienceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickTime(BuildContext context,
      {required bool isInterviewTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isInterviewTime) {
          _interviewTime = picked;
        } else {
          _workTime = picked;
        }
      });
    }
  }

  bool isLoading = false;
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      final jobPost = JobPost(
        qualification: widget.jobDescriptionData.selectedQualification,
        department: widget.jobPostingData.department,
        city: widget.jobPostingData.city,
        locality: widget.jobPostingData.locality,
        minMonthlySalary: widget.jobPostingData.minMonthlySalary,
        maxMonthlySalary: widget.jobPostingData.maxMonthlySalary,
        staff: widget.jobPostingData.numberOfStaff,
        minExperience: _minExperienceController.text,
        maxExperience: _maxExperienceController.text,
        totalExperience: _totalExperienceController.text,
        workFromHome: widget.jobPostingData.wFH,
        gender: widget.jobDescriptionData.selectedGender,
        englishSpeaking: widget.jobDescriptionData.selectedEnglishSkill,
        skills: widget.jobDescriptionData.selectedSkills,
        description: _descController.text.toString(),
        company: _companyNameController.text,
        recruiter: _recruiterNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _companyAddressController.text,
        jobRole: _jobRoleController.text,
        interviewTiming: _interviewTime,
        workTiming: _workTime,
      );
      print('JOB DATA ${jobPost.city}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

      final response = await http.post(
        Uri.parse('${AppConstants.sambhavBaseUrl}/job/p1/job/recruiter'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(jobPost.toJson()),
      );

      if (response.statusCode == 200) {
        setState(() => isLoading = false);
        Get.to(AdditionalDetailsScreen());
      } else {
        setState(() => isLoading = false);
        print(response.statusCode);
        print(response.body);
        print('Failed to submit job post. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Company Form",
        size: 50,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          children: [
            _buildTextFormField(
              controller: _companyNameController,
              label: 'Name of My Company',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the company name' : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _recruiterNameController,
              label: 'Contact Person / Recruiter Name',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the recruiter name' : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _emailController,
              label: 'Email ID',
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty || !value.contains('@')
                  ? 'Please enter a valid email'
                  : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _phoneController,
              label: 'Phone Number',
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a phone number' : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _companyAddressController,
              label: 'My Company Address',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the company address' : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _jobRoleController,
              label: 'Job Role',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the job role' : null,
            ),
            height(20),
            _buildTextFormField(
              controller: _descController,
              label: 'Job description',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a valid Description' : null,
            ),
            height(20),
            _buildTimeField(
              context: context,
              label: 'Interview Timing',
              time: _interviewTime,
              onTap: () => _pickTime(context, isInterviewTime: true),
            ),
            height(20),
            _buildTimeField(
              context: context,
              label: 'Work Timing',
              time: _workTime,
              onTap: () => _pickTime(context, isInterviewTime: false),
            ),
            height(20),
            _buildTextFormField(
              keyboardType: TextInputType.number,
              controller: _minExperienceController,
              label: 'Min Experience',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the Minimum Experience' : null,
            ),
            height(20),
            _buildTextFormField(
              keyboardType: TextInputType.number,
              controller: _maxExperienceController,
              label: 'Max Experience',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the Maximum Experience' : null,
            ),
            height(20),
            _buildTextFormField(
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
              controller: _totalExperienceController,
              label: 'Total Experience',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the Total Experience' : null,
            ),
            height(20),
            Row(
              children: [
                Icon(Icons.warning, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Asking job seekers for any kind of payment is strictly prohibited",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: Dimensions.fontSizeExtraSmall,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "job screen",
            shape: StadiumBorder(),
            onPressed: () => Navigator.pop(context),
            backgroundColor: Colors.blue,
            child: Icon(Icons.arrow_left),
          ),
          FloatingActionButton(
            heroTag: "submit",
            shape: StadiumBorder(),
            onPressed: isLoading == true ? null : _submitForm,
            child: isLoading == true
                ? loading(color: Colors.white)
                : Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeExtraSmall,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    TextInputAction action = TextInputAction.next,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSizeSmall,
          color: ThemeColors.darkBlueColor,
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: action,
      validator: validator,
    );
  }

  Widget _buildTimeField({
    required BuildContext context,
    required String label,
    required TimeOfDay? time,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizeSmall,
            color: ThemeColors.darkBlueColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time != null ? time.format(context) : 'Select time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeSmall,
                color: ThemeColors.darkBlueColor,
              ),
            ),
            Icon(
              Icons.access_time,
              color: ThemeColors.darkBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}

class JobPost {
  String city;
  String locality;
  int minMonthlySalary;
  int maxMonthlySalary;
  int? bonusAmount;
  String? bonusType;
  int staff;
  String department;
  String qualification;
  String? totalExperience;
  String minExperience;
  String maxExperience;
  String gender;
  String englishSpeaking;
  List<String> skills;
  String? workFromHome;
  String jobRole;
  TimeOfDay? workTiming;
  TimeOfDay? interviewTiming;
  String company;
  String description;
  String recruiter;
  String email;
  String phone;
  String address;

  JobPost({
    required this.qualification,
    required this.department,
    required this.city,
    required this.locality,
    required this.minMonthlySalary,
    required this.maxMonthlySalary,
    this.bonusAmount,
    this.bonusType,
    required this.staff,
    this.totalExperience,
    required this.minExperience,
    required this.maxExperience,
    required this.gender,
    required this.englishSpeaking,
    required this.skills,
    this.workFromHome,
    required this.jobRole,
    required this.workTiming,
    required this.interviewTiming,
    required this.company,
    required this.description,
    required this.recruiter,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'qualification': qualification,
      'department': department,
      'city': city,
      'locality': locality,
      'monthly_salary': {
        'min': minMonthlySalary,
        'max': maxMonthlySalary,
      },
      'bonus': bonusAmount != null && bonusType != null
          ? {
              'amount': bonusAmount,
              'type': bonusType,
            }
          : null,
      'staff': staff,
      'total_experience': totalExperience,
      'experience': {
        'min': minExperience,
        'max': maxExperience,
      },
      'gender': gender,
      'english_speaking': englishSpeaking,
      'skills': skills,
      'work_from_home': workFromHome,
      'job_role': jobRole,
      'interview_timing': interviewTiming != null
          ? '${interviewTiming!.hour}:${interviewTiming!.minute}'
          : '',
      'work_timing':
          workTiming != null ? '${workTiming!.hour}:${workTiming!.minute}' : '',
      'company': company,
      'description': description,
      'recruiter': recruiter,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
