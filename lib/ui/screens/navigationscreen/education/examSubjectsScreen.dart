import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/examChapterScreen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/education_providers/education_provider.dart';
import '../../../../themes/colors.dart';

class ExamSubjectsScreen extends StatefulWidget {
  final String title;
  final String exam_id;
  final String type;

  const ExamSubjectsScreen(
      {super.key,
      required this.type,
      required this.title,
      required this.exam_id});

  @override
  State<ExamSubjectsScreen> createState() => _ExamSubjectsScreenState();
}

class _ExamSubjectsScreenState extends State<ExamSubjectsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final subjectProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    subjectProvider.getExamsSubjects(exam_id: widget.exam_id);
    subjectProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        size: 55,
      ),
      body: Consumer<EductionFormProvider>(
          builder: (context, subjectProvider, child) {
        return ListView.separated(
          separatorBuilder: (_, index) {
            return const SizedBox(height: 15);
          },
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: subjectProvider.examSubjects.length,
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
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => ExamChaptersScreen(
                                type: widget.type,
                                exam_name: widget.title,
                                subject_name: subjectProvider
                                    .examSubjects[index].subject_name,
                                list: subjectProvider
                                    .examSubjects[index].chapters)));
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
                                subjectProvider
                                    .examSubjects[index].subject_name,
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
