import 'package:flutter/material.dart';
import 'package:payapp/models/competitive_model.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../provider/education_providers/education_provider.dart';
import '../../../../provider/loginSignUpProvider.dart';
import '../../../../themes/colors.dart';
import 'downloadPdfButton.dart';

class PapersListScreen extends StatefulWidget {
  const PapersListScreen({super.key});

  @override
  State<PapersListScreen> createState() => _PapersListScreenState();
}

class _PapersListScreenState extends State<PapersListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final notesProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    notesProvider.getPapers(userId: userProvider.userModel!.id);
    notesProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Papers",
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
          itemCount: notesProvider.papersList.length,
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
                  //   // print(val);
                  // },
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
                                notesProvider.papersList[index].subjectName,
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
                        DownloadPdfButton(
                          competitiveNotes: CompetitiveNotes(
                            id: "",
                            fileName: notesProvider.papersList[index].fileName,
                            examId: "",
                            pdfFile: notesProvider.papersList[index].pdfFile,
                            topic: "",
                          ),
                        ),
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
