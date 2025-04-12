import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/ui/screens/navigationscreen/education/education_services/single-chapter/singleChapterQs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';

class SingleSubject extends StatefulWidget {
  const SingleSubject({super.key});

  @override
  State<SingleSubject> createState() => _SingleSubjectState();
}

class _SingleSubjectState extends State<SingleSubject> {
  bool _isLoading = false;
  List<dynamic> _exams = [];

  @override
  void initState() {
    super.initState();
    _fetchExams();
  }

  Future<void> _fetchExams() async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('token');

    if (jwtToken != null) {
      final url =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/quiz/exam');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _exams = json.decode(response.body)['data'];
          _isLoading = false;
        });
      } else {
        // Handle other status codes
        setState(() {
          _isLoading = false;
        });
        print('Failed to load exams: ${response.statusCode}');
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
      appBar: const AppBarWidget(
        title: "Chapter-wish previous year question",
        size: 55,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _exams.isEmpty
              ? Center(child: Text('No exams available'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _exams.length,
                        itemBuilder: (context, index) {
                          final exam = _exams[index];
                          return BoxButtonExamWidget(
                            pngIconPath: exam['exam_logo'],
                            title: exam['exam_name'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleChapterQs(
                                          examId: exam["id"],
                                          examName: exam["exam_name"],
                                        )),
                              );
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
