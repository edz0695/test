import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/videolecture/chapterscreen.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/subjectwidget.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final subjectProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    subjectProvider.getSubjects();
    subjectProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: "Video Lectures",
          size: 55,
        ),
        body: SafeArea(
            child: Column(children: [
          Expanded(
            child: Consumer<EductionFormProvider>(
                builder: (context, subjectProvider, child) {
              return subjectProvider.isLoadingCategorised
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 100),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: subjectProvider.subjectsList.length,
                      itemBuilder: (context, index) {
                        return SubjectTileWidget(
                          subject: subjectProvider.subjectsList[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChapterScreen(
                                          id: subjectProvider
                                              .subjectsList[index]
                                              .data
                                              .first
                                              .id,
                                          subject_name: subjectProvider
                                              .subjectsList[index]
                                              .data
                                              .first
                                              .name,
                                        )));
                          },
                        );
                      },
                    );
            }),
          ),
        ])),
      ),
    );
  }
}
