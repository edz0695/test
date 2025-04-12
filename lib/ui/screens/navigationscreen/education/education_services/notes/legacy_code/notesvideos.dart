import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/exvideoswidget.dart';
import 'package:provider/provider.dart';

import '../../../../../../../config/apiconfig.dart';
import '../../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../dialogs/loaderdialog.dart';
import '../../../../../../widgets/app_bar_widget.dart';




class NotesVideoScreen extends StatefulWidget {
  final String id;
  const NotesVideoScreen({super.key, required this.id});

  @override
  State<NotesVideoScreen> createState() => _NotesVideoScreenState();
}

class _NotesVideoScreenState extends State<NotesVideoScreen>{
  @override
  @override
  void initState() {

    super.initState();
    final notesProvider = Provider.of<EductionFormProvider>(context,listen: false);
    notesProvider.getExamsVideos(chapter_id: widget.id);
    notesProvider.isLoadingCategorised = true;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar :const AppBarWidget(title: "Exam videos",size: 55,),
        body: SafeArea(
          child:Column(
            children: [
               Expanded(
                child: Consumer<EductionFormProvider>(
                  builder: (context, notesProvider, child) {
                    return notesProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 100),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: notesProvider.examVideoslist.length,
                      itemBuilder: (context, index) {
                        return ExamVideosWidget(lecture: notesProvider.examVideoslist[index],onTap: (){
showVideoDialog(context,
                          videoUrl:
                              Constants.forImg+notesProvider.examVideoslist[index].notes_video);
                    },);
                      },
                    );
                  }
                ),
              ),

            ]
          )
        ),

       ),
    );
  }
}
