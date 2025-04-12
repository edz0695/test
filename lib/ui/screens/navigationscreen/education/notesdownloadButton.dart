import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/models/examnotesmodel.dart';

class NotesDownloadButton extends StatefulWidget {
  final ExamNotes competitiveNotes;
  const NotesDownloadButton({super.key,required this.competitiveNotes});

  @override
  State<NotesDownloadButton> createState() => _NotesDownloadButtonState();
}

class _NotesDownloadButtonState extends State<NotesDownloadButton> {
  double progress = 0;
  bool showProgress = false;
  bool done = false;
  String? path;

  Future downloadFile(var filePath, var documentUrl) async {

    try {
      /// setting filename
      final filename = filePath;
      String? dir = (await getExternalStorageDirectory())?.path;
      if (await File('$dir/$filename').exists())
      {
        path = File('$dir/$filename').absolute.path;
        showProgress = false;
        done = true;
        setState(() {

        });
        return File('$dir/$filename');
      }

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
        path = file.absolute.path;
        showProgress = false;
        done = true;
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
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async{
      final filename = widget.competitiveNotes.notes_file;
      String? dir = (await getExternalStorageDirectory())?.path;
      if (await File('$dir/$filename').exists())
      {
      path = File('$dir/$filename').absolute.path;
      showProgress = false;
      done = true;
      setState(() {

      });
      // return File('$dir/$filename');
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return showProgress?CircularProgressIndicator(value: progress,):Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: done?(){
          printThis(path);
          // launchUrl(Uri.parse(path!));
          // OpenFile.open(path!);
        }:(){
          setState(() {
            showProgress = true;
          });
          downloadFile(widget.competitiveNotes.fileName,widget.competitiveNotes.notes_file);
        },
        child: Container(
          height: 32,
          width: 70,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue,width: 1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text(done?"View":"Download",style: const TextStyle(fontSize: 12),)),
        ),
      ),
    );
  }
}
