import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/models/ExamSubjects.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/pyq/examquizes.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/education_providers/education_provider.dart';
import '../../../../themes/colors.dart';
import 'education_services/notes/legacy_code/notesvideos.dart';
import 'examNotesScreen.dart';

class ExamChaptersScreen extends StatefulWidget {
  final String subject_name;
  final String exam_name;
  final String type;
  final List<ExamChapters> list;

  const ExamChaptersScreen(
      {super.key,
      required this.type,
      required this.exam_name,
      required this.subject_name,
      required this.list});

  @override
  State<ExamChaptersScreen> createState() => _ExamChaptersScreenState();
}

class _ExamChaptersScreenState extends State<ExamChaptersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "${widget.exam_name} => ${widget.subject_name}",
        size: 55,
      ),
      body: Consumer<EductionFormProvider>(
          builder: (context, notesProvider, child) {
        return ListView.separated(
          separatorBuilder: (_, index) {
            return const SizedBox(height: 15);
          },
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  splashColor: ThemeColors.primaryBlueColor.withOpacity(.05),
                  highlightColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    widget.type == 'video'
                        ? Navigator.push(
                            context,
                            CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => NotesVideoScreen(
                                    id: widget.list[index].id)))
                        : widget.type == 'quize'
                            ? Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) =>
                                        QuizScreen(id: widget.list[index].id)))
                            : Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => ExamNotesScreen(
                                        chapter_name:
                                            widget.list[index].chapter_name,
                                        chapter_id: widget.list[index].id)));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.list[index].chapter_name,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 7,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(notes.subject_name,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,color: Colors.grey),),
                              //     Text('Class:- '+notes.class_name,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,color: Colors.grey),),
                              //   ],)
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
