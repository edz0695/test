import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/pdfListScreen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../../../provider/education_providers/education_provider.dart';

class CompetitiveExams extends StatefulWidget {
  const CompetitiveExams({super.key});

  @override
  State<CompetitiveExams> createState() => _CompetitiveExamsState();
}

class _CompetitiveExamsState extends State<CompetitiveExams> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final notesProvider = Provider.of<EductionFormProvider>(context,listen: false);
    final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
    notesProvider.getCompetitiveExams(userId: userProvider.userModel!.id);
    notesProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Competitive Exams', size: 55),
      body: Consumer<EductionFormProvider>(
          builder: (context, compProv, child) {
            return  compProv.isLoadingCategorised? const Center(child: CircularProgressIndicator(strokeWidth: 2,),):GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (1 / 1),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: compProv.competitiveList.length,
                itemBuilder: (_, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context)=>PdfListScreen(title: compProv.competitiveList[index].examName,list: compProv.competitiveList[index].notes,)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(compProv.competitiveList[index].image,fit: BoxFit.fill,),
                            ),
                            const SizedBox(height: 10,),
                            Text(compProv.competitiveList[index].examName,style: const TextStyle(fontWeight: FontWeight.normal,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
