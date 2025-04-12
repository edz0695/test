import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/education_providers/education_provider.dart';
import '../../../../themes/colors.dart';
import 'notesdownloadButton.dart';

class ExamNotesScreen extends StatefulWidget {
  final String chapter_name;
  final String chapter_id;

  const ExamNotesScreen(
      {super.key, required this.chapter_name, required this.chapter_id});

  @override
  State<ExamNotesScreen> createState() => _ExamNotesScreenState();
}

class _ExamNotesScreenState extends State<ExamNotesScreen> {
  double progress = 0;

  Future downloadFile(var filePath, var documentUrl) async {
    try {
      /// setting filename
      final filename = filePath;
      String? dir = (await getExternalStorageDirectory())?.path;
      if (await File('$dir/$filename').exists()) return File('$dir/$filename');

      String url = documentUrl;

      /// requesting http to get url
      final request = Request("GET", Uri.parse(url));
      final response = await Client().send(request);
      final contentLength = response.contentLength;
      // var request = await HttpClient().getUrl(Uri.parse(url));

      /// closing request and getting response
      // var response = await request.close();

      /// getting response data in bytes
      final bytes = <int>[];

      response.stream.listen((value) {
        bytes.addAll(value);
        progress = bytes.length / contentLength!;
        setState(() {});
      }, onDone: () {
        progress = 1;
        File file = File('$dir/$filename');

        /// writing bytes data of response in the file.
        file.writeAsBytesSync(bytes);
        setState(() {});
      });

      /// generating a local system file with name as 'filename' and path as '$dir/$filename'

      printThis('$dir/$filename');

      return null;
    } catch (err) {
      printThis(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final notesProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    notesProvider.getExamsNotes(chapter_id: widget.chapter_id);
    notesProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.chapter_name,
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
          itemCount: notesProvider.examNoteslist.length,
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
                    // Navigator.push(
                    //   context, CupertinoPageRoute(
                    //     fullscreenDialog: true,
                    //     builder: (context)=>ExamChaptersScreen(exam_name: widget.chapter_name,subject_name: notesProvider.examNoteslist[index].title, list: subjectProvider.examSubjects[index].chapters)
                    //   )
                    // );
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
                                notesProvider.examNoteslist[index].title,
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
                        NotesDownloadButton(
                            competitiveNotes:
                                notesProvider.examNoteslist[index]),
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
