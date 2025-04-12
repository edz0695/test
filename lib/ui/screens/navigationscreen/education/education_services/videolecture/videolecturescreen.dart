import 'package:flutter/material.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/widgets/lecturewidget.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/apiconfig.dart';
import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../dialogs/loaderdialog.dart';
import '../../../../../widgets/app_bar_widget.dart';



class VideoLectureScreen extends StatefulWidget {
  final String id;
  const VideoLectureScreen({super.key, required this.id});

  @override
  State<VideoLectureScreen> createState() => _VideoLectureScreenState();
}

class _VideoLectureScreenState extends State<VideoLectureScreen>{
  @override
  void initState() {
    printThis('I am here');
    super.initState();
    final lectureProvider = Provider.of<EductionFormProvider>(context,listen: false);
    lectureProvider.getVideoLectures(id: widget.id);
    lectureProvider.isLoadingCategorised = true;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar :const AppBarWidget(title: "Video Lectures",size: 55,),
        body: SafeArea(
          child:Column(
            children: [
               Expanded(
                child: Consumer<EductionFormProvider>(
                  builder: (context, lectureProvider, child) {
                    return lectureProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 100),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: lectureProvider.videolectureList.length,
                      itemBuilder: (context, index) {
                        return LectureWidget(lecture: lectureProvider.videolectureList[index],onTap: (){
                          if (lectureProvider.videolectureList[index].video != null) {showVideoDialog(context,
                            videoUrl:
                                Constants.forImg+lectureProvider.videolectureList[index].video!);
                      }},);
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
