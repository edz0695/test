import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../themes/colors.dart';
import 'jobs_search_screen.dart';

class SeeJobsScreen extends StatefulWidget {
  const SeeJobsScreen({super.key});

  @override
  _SeeJobsScreenState createState() => _SeeJobsScreenState();
}

class _SeeJobsScreenState extends State<SeeJobsScreen> {
  String _selectedEnglishProficiency =
      "Good English"; // Default selected proficiency
  final TextEditingController _locationController = TextEditingController();
  int activeStep = 3;

  List<String> englishProficiencyLevels = [
    "No English",
    "Thoda English 2",
    "Good English",
    "Fluent English"
  ];
  List<String> allLanguages = [
    "English",
    "Spanish",
    "French",
    "German",
    "Mandarin",
    "Arabic",
    "Hindi",
    "Russian"
  ];
  List<String> selectedLanguages = ["English"]; // English is default

  void _showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search Location',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _locationController.text = value;
                });
              },
            ),
            ListTile(
              title: const Text("New York"),
              onTap: () {
                _locationController.text = "New York"; // Example city
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Los Angeles"),
              onTap: () {
                _locationController.text = "Los Angeles";
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showLanguagesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: allLanguages.map((language) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                label: Text(language),
                selected: selectedLanguages.contains(language),
                onSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedLanguages.add(language);
                    } else {
                      selectedLanguages.remove(language);
                    }
                  });
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 80,
                  color: ThemeColors.primaryBlueColor,
                  child: StepProgressIndicator()),
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.grey,
                child: const Text(
                  "Additional info like language preferences, Resume, etc. helps us to filter relevant jobs for you",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color:Color(0xff184070) ,
                  ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.0,vertical:10),
                child:  Text(
                  'Choose Proficiency',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:Color(0xff184070) ,
                  ),
                ),
              ),

              GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                shrinkWrap: true,

                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(10),
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: englishProficiencyLevels.map((level) {
                  bool isSelected = level == _selectedEnglishProficiency;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedEnglishProficiency = level;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blueAccent
                            : Colors.transparent, // Indicate selected
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical:12),
                child: GestureDetector(
                  onTap: () => _showLocationBottomSheet(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Preferred Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical:12),
                child: GestureDetector(
                  onTap: () => _showLanguagesBottomSheet(context),
                  child: const AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Preferred Languages',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true, // Prevent user from typing
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
                      builder: (context) => JobSearchScreen(),
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
                        "See Job",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: const Row(
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
            child: Divider(color: Colors.blue, thickness: 3),
          ),
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
              '4',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
