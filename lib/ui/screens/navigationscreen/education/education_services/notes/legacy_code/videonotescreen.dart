import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/examSubjectsScreen.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../provider/education_providers/education_provider.dart';

class NotesVideoScreen extends StatefulWidget {
  const NotesVideoScreen({super.key});

  @override
  State<NotesVideoScreen> createState() => _NotesVideoScreenState();
}

class _NotesVideoScreenState extends State<NotesVideoScreen>{

  @override
  void initState() {

    super.initState();
    final notesProvider = Provider.of<EductionFormProvider>(context,listen: false);
    final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
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
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0,1)
                        )
                      ]
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Subject',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: subjectList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedSubject,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),
                      buttonStyleData:  ButtonStyleData(
                          height: 40,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          overlayColor: WidgetStateProperty.all(Colors.white)
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0,1)
                        )
                      ]
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Chapter',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: chapterList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedChapter,
                      onChanged: (String? value) {
                        setState(() {
                          selectedChapter = value;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),
                      buttonStyleData:  ButtonStyleData(
                          height: 40,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          overlayColor: WidgetStateProperty.all(Colors.white)
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0,1)
                        )
                      ]
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Exam',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: examList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedExam,
                      onChanged: (String? value) {
                        setState(() {
                          selectedExam = value;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),
                      buttonStyleData:  ButtonStyleData(
                          height: 40,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          overlayColor: WidgetStateProperty.all(Colors.white)
                      ),


                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        selectedSubject!=null && selectedChapter != null && selectedExam != null
            ? Consumer<EductionFormProvider>(
              builder: (context, compProv, child) {
                return  compProv.isLoadingCategorised? const Center(child: CircularProgressIndicator(strokeWidth: 2,),):GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (1 / 1),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15),
                    itemCount: compProv.competitiveList.length,
                    itemBuilder: (_, index) {
                      return Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context)=>ExamSubjectsScreen(type: 'video',title: compProv.competitiveList[index].examName, exam_id: compProv.competitiveList[index].examId))
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(compProv.competitiveList[index].image,fit: BoxFit.fill,),
                                ),
                                const SizedBox(height: 10,),
                                Text(compProv.competitiveList[index].examName,style: const TextStyle(fontWeight: FontWeight.normal,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              })
            : Container(
              margin: EdgeInsets.only(top: size.height*.30),
              child: const Text("Select subject, Chapter & Exam."),
              ),
      ],
    );
  }
}
