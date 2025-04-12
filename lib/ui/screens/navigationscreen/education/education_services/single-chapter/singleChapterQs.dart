import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/ui/screens/navigationscreen/education/education_services/single-chapter/single-chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/box_button_widget.dart';
import '../../chapterslist.dart';

class SingleChapterQs extends StatefulWidget {
  final String examId;
  final String examName;

  const SingleChapterQs(
      {super.key, required this.examId, required this.examName});

  @override
  State<SingleChapterQs> createState() => _SingleChapterQsState();
}

class _SingleChapterQsState extends State<SingleChapterQs> {
  bool _isLoading = false;
  List<dynamic> _subjects = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('token');

    if (jwtToken != null) {
      final url =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/quiz/subject');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        setState(() {
          _subjects = data.where((subject) {
            final examId =
                subject['exam_id']?['id']; // Check if 'exam_id' is not null
            return examId != null && examId == widget.examId;
          }).toList();
          _isLoading = false;
        });
      } else {
        // Handle other status codes
        setState(() {
          _isLoading = false;
        });
        print('Failed to load subjects: ${response.statusCode}');
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print('JWT Token not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.examName,
        size: 55,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _subjects.isEmpty
              ? Center(child: Text('No subjects available for this exam'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.25,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _subjects.length,
                        itemBuilder: (context, index) {
                          final subject = _subjects[index];
                          return BoxButtonExamWidget(
                            pngIconPath: subject['subject_logo'],
                            title: subject['subject_name'],
                            onTap: () {
                              print("subjecting");

                              print(subject);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SingleChapter(
                                    examName: subject["exam_id"]["exam_name"],
                                    subjectId: subject["id"],
                                    subjectName: subject["subject_name"],
                                    subjectLogo: subject["subject_logo"],
                                  ),
                                ),
                              );
                              // Handle onTap for subject
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}

class BoxButtonExamWidget extends StatelessWidget {
  final String title;
  final String pngIconPath;
  final Function()? onTap;
  final IconData? iconData;
  final bool withShadow;

  const BoxButtonExamWidget({
    super.key,
    required this.title,
    required this.pngIconPath,
    this.onTap,
    this.iconData,
    this.withShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: ThemeColors.primaryBlueColor.withOpacity(0.65),
                        blurRadius: 10.0,
                        spreadRadius: 3),
                  ]
                : [],
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black.withOpacity(.08),
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: iconData != null
                  ? Center(
                      child: Icon(
                        iconData,
                        color: ThemeColors.blueColor1,
                        size: 40,
                      ),
                    )
                  : Image.network(
                      pngIconPath,
                      height: 40,
                      width: 40,
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
