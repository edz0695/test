import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/videolecture/videolecturescreen.dart';
import 'package:payapp/ui/widgets/chapterwidget.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../widgets/app_bar_widget.dart';

class ChapterScreen extends StatefulWidget {
  final String id;
  final String subject_name;

  const ChapterScreen(
      {super.key, required this.id, required this.subject_name});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  void initState() {
    super.initState();
    final chapterProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    chapterProvider.getChapters(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(
          title: "Video Lectures - ( ${widget.subject_name} )",
          size: 55,
        ),
        body: SafeArea(
            child: Column(children: [
          Expanded(
            child: Consumer<EductionFormProvider>(
                builder: (context, chapterProvider, child) {
              return chapterProvider.isLoadingCategorised
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 100),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: chapterProvider.chapterList.length,
                      itemBuilder: (context, index) {
                        return ChapterWidget(
                          subject:
                              chapterProvider.chapterList[index].data[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoLectureScreen(
                                        id: chapterProvider.subjectsList[index]
                                            .data.first.id)));
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
