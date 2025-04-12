import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/examSubjectsScreen.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';

class NotesShortsTabLegacy extends StatefulWidget {
  const NotesShortsTabLegacy({super.key});

  @override
  State<NotesShortsTabLegacy> createState() => _NotesShortsTabLegacyState();
}

class _NotesShortsTabLegacyState extends State<NotesShortsTabLegacy> {
  @override
  void initState() {

    super.initState();
    final notesProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    notesProvider.getCompetitiveExams(userId: userProvider.userModel?.id);
    notesProvider.isLoadingCategorised = true;
  }

  var selectedSubject, selectedExam, selectedChapter;

  final List<String> subjectList = [
    'Subject 1',
    'Subject 2',
    'Subject 3',
    'Subject 4',
  ];
  final List<String> examList = [
    'Exam 1',
    'Exam 2',
    'Exam 3',
    'Exam 4',
  ];
  final List<String> chapterList = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(

    );
  }
}
