import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/src/src.dart';
import 'package:payapp/ui/screens/navigationscreen/education/hire_services/screens/job_description_screen.dart';
import '../../../../../widgets/app_bar_widget.dart';

class JobPostingData {
  String jobTitle;
  String city;
  String locality;
  int minMonthlySalary;
  int maxMonthlySalary;
  bool offerBonus;
  int bonusMax;
  String bonusType;
  String department;
  String wFH;
  int numberOfStaff;

  JobPostingData({
    required this.wFH,
    required this.jobTitle,
    required this.city,
    required this.locality,
    required this.minMonthlySalary,
    required this.maxMonthlySalary,
    required this.offerBonus,
    required this.bonusMax,
    required this.bonusType,
    required this.department,
    required this.numberOfStaff,
  });

  bool isComplete() {
    return jobTitle.isNotEmpty &&
        city.isNotEmpty &&
        locality.isNotEmpty &&
        department.isNotEmpty &&
        wFH.isNotEmpty &&
        bonusType.isNotEmpty &&
        bonusMax != 0 &&
        minMonthlySalary != 0 &&
        maxMonthlySalary != 0 &&
        (!offerBonus ||
            (offerBonus && bonusMax != 0 && bonusType.isNotEmpty)) &&
        numberOfStaff != 0;
  }
}

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  _JobPostingScreenState createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController areaOfWorkController = TextEditingController();
  final TextEditingController salaryRangeStartController =
      TextEditingController();
  final TextEditingController salaryRangeEndController =
      TextEditingController();
  final TextEditingController bonusMaxController = TextEditingController();
  final TextEditingController bonusTypeController = TextEditingController();
  bool offerBonus = false;
  bool wFH = false;
  int numberOfStaff = 1;
  String department = '';

  @override
  void initState() {
    super.initState();
    fetchDepartmentOptions();
  }

  List<Map<String, dynamic>> departmentOptions = [];

  Future<void> fetchDepartmentOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    Uri url = Uri.parse('https://xyzabc.sambhavapps.com/v1/job/p1/departments');
    http.Response response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        setState(() {
          departmentOptions =
              List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        // Handle error
      }
    } else {
      // Handle error
    }
  }

  void _navigateToNextScreen() {
    JobPostingData jobPostingData = JobPostingData(
      wFH: wFH ? "YES" : "NO",
      jobTitle: jobTitleController.text,
      city: cityController.text,
      locality: localityController.text,
      minMonthlySalary: int.tryParse(salaryRangeStartController.text) ?? 0,
      maxMonthlySalary: int.tryParse(salaryRangeEndController.text) ?? 0,
      offerBonus: offerBonus,
      bonusMax: offerBonus ? int.tryParse(bonusMaxController.text) ?? 0 : 0,
      bonusType: offerBonus ? bonusTypeController.text : '',
      department: areaOfWorkController.text,
      numberOfStaff: numberOfStaff,
    );

    if (jobPostingData.isComplete()) {
      // Navigate to the next screen
      Get.to(() => JobDescriptionScreen(jobPostingData: jobPostingData));
    } else {
      // Show an error message if the data is incomplete
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Incomplete Data'),
            content: const Text('Please fill all the required fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void showBottomSheet(
      String title, List<String> options, TextEditingController controller) {
    List<String> filteredOptions = List.from(options);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                    onChanged: (text) {
                      setState(() {
                        filteredOptions = options
                            .where((option) => option
                                .toLowerCase()
                                .contains(text.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  height(20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredOptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = filteredOptions[index];
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            controller.text = option;
                            Get.back();
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget buildTextFieldWithDescription({
    required String description,
    required TextEditingController controller,
    List<String>? options,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizeSmall,
            color: ThemeColors.darkBlueColor,
          ),
        ),
        const SizedBox(height: 10),
        if (options != null && options.isNotEmpty)
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => showBottomSheet(controller.text, options, controller),
            child: Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: controller,
                        builder: (context, value, child) {
                          return Text(
                            value.text.isNotEmpty
                                ? value.text
                                : "Tap to select",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeSmall,
                              color: ThemeColors.darkBlueColor,
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.arrow_drop_down, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          SizedBox(
            width: double.infinity,
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeSmall,
                color: ThemeColors.darkBlueColor,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
              readOnly: true,
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Job Posting', size: 50),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            'I Want to Hire a',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
          ),
          height(10),
          TextField(
            controller: jobTitleController,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          height(20),
          Text(
            'In the city',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
          ),
          height(10),
          TextField(
            controller: cityController,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          height(20),
          Text(
            'For the Locality',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
          ),
          height(10),
          TextField(
            controller: localityController,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          height(20),
          buildTextFieldWithDescription(
            description: 'Area of Work',
            controller: areaOfWorkController,
            options: departmentOptions
                .map((dept) => dept['title'].toString())
                .toList(),
          ),
          height(10),
          Text(
            "I will pay a monthly salary of : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeSmall,
              color: ThemeColors.darkBlueColor,
            ),
          ),
          height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.size.width * .4,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: salaryRangeStartController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeSmall,
                    color: ThemeColors.darkBlueColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Min',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeSmall,
                      color: ThemeColors.darkBlueColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: Get.size.width * .4,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: salaryRangeEndController,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeSmall,
                    color: ThemeColors.darkBlueColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Max',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeSmall,
                      color: ThemeColors.darkBlueColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Work from home (WFH)?',
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                  color: ThemeColors.darkBlueColor,
                ),
              ),
              Checkbox(
                value: wFH,
                onChanged: (value) {
                  setState(() {
                    wFH = value!;
                  });
                },
              ),
            ],
          ),
          height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Do you offer bonus in addition to\nmonthly salary?',
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                  color: ThemeColors.darkBlueColor,
                ),
              ),
              Checkbox(
                value: offerBonus,
                onChanged: (value) {
                  setState(() {
                    offerBonus = value!;
                  });
                },
              ),
            ],
          ),
          if (offerBonus) ...[
            SizedBox(height: 16),
            TextField(
              controller: bonusMaxController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeDefault,
                color: ThemeColors.darkBlueColor,
              ),
              decoration: InputDecoration(
                labelText: 'Maximum Bonus Offered',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                  color: ThemeColors.darkBlueColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            height(20),
            TextField(
              controller: bonusTypeController,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeDefault,
                color: ThemeColors.darkBlueColor,
              ),
              decoration: InputDecoration(
                labelText: 'Bonus Type (e.g., Performance, Year-End)',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                  color: ThemeColors.darkBlueColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ],
          height(20),
          TextField(
            controller: TextEditingController(text: numberOfStaff.toString()),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeDefault,
              color: ThemeColors.darkBlueColor,
            ),
            decoration: InputDecoration(
              labelText: 'Number of Staff Needed',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeSmall,
                color: ThemeColors.darkBlueColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text) {
              numberOfStaff = int.parse(text);
            },
          ),
          height(100)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: _navigateToNextScreen,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
