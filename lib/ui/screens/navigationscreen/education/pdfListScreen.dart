import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payapp/models/competitive_model.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../../core/components/print_text.dart';
import '../../../../provider/education_providers/education_provider.dart';
import '../../../../themes/colors.dart';
import 'package:http/http.dart';

import 'downloadPdfButton.dart';

class PdfListScreen extends StatefulWidget {
  final String title;
  final List<CompetitiveNotes> list;

  const PdfListScreen({super.key, required this.title, required this.list});

  @override
  State<PdfListScreen> createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {

  double progress = 0;
  Future downloadFile(var filePath, var documentUrl) async {

    try {
      /// setting filename
      final filename = filePath;
      String? dir = (await getExternalStorageDirectory())?.path;
      if (await File('$dir/$filename').exists()) return File('$dir/$filename');

      String url = documentUrl;

      /// requesting http to get url
      final request = Request("GET",Uri.parse(url));
      final response = await Client().send(request);
      final contentLength = response.contentLength;
      // var request = await HttpClient().getUrl(Uri.parse(url));

      /// closing request and getting response
      // var response = await request.close();

      /// getting response data in bytes
      final bytes = <int>[];

      response.stream.listen((value) {
        bytes.addAll(value);
        progress = bytes.length/contentLength!;
        setState(() {

        });
      },onDone: (){
        progress = 1;
        File file = File('$dir/$filename');

        /// writing bytes data of response in the file.
        file.writeAsBytesSync(bytes);
        setState(() {

        });
      });

      /// generating a local system file with name as 'filename' and path as '$dir/$filename'

      printThis('$dir/$filename');

      return null;
    }
    catch (err) {
      printThis(err);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        size: 55,
      ),
      body: Consumer<EductionFormProvider>(
          builder: (context, notesProvider, child) {
        return ListView.separated(
          separatorBuilder: (_, index) {
            return const SizedBox(height: 15);
          },
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
          physics:
              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                  // onTap: () async {
                  //   // final val = downloadFile("downloadFil85558.pdf",widget.list[index].pdfFile);
                  //   // printThis(val);
                  // },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                widget.list[index].topic,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.05,
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
                        // Material(
                        //   color: Colors.white,
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: InkWell(
                        //     borderRadius: BorderRadius.circular(10),
                        //     onTap: (){
                        //       downloadFile("downloadFil85558.pdf",widget.list[index].pdfFile);
                        //     },
                        //     child: Container(
                        //       height: 32,
                        //       width: 70,
                        //       padding: EdgeInsets.all(5),
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.blue,width: 1),
                        //         borderRadius: BorderRadius.circular(10)
                        //       ),
                        //       child: Center(child: Text("Download",style: TextStyle(fontSize: 12),)),
                        //     ),
                        //   ),
                        // ),
                        DownloadPdfButton(competitiveNotes: widget.list[index],),
                        // CircularProgressIndicator(value: progress,),
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
