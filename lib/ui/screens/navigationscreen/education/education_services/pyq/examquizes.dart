import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/pyq/quizedetails.dart';
import 'package:payapp/ui/widgets/quize/quizewidget.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../widgets/app_bar_widget.dart';



class QuizScreen extends StatefulWidget {
  final String id;
  const QuizScreen({super.key, required this.id});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{
  @override
  @override
  void initState() {

    super.initState();
    final quizProvider = Provider.of<EductionFormProvider>(context,listen: false);
    quizProvider.getExamsQuiz(chapterId: widget.id);
    quizProvider.isLoadingCategorised = true;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar :const AppBarWidget(title: "Quiz",size: 55,),
        body: SafeArea(
          child:Column(
            children: [
               Expanded(
                child: Consumer<EductionFormProvider>(
                  builder: (context, quizProvider, child) {
                    return quizProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: quizProvider.examQuizes.length,
                      itemBuilder: (context, index) {
                        return QuizeWidget(quize: quizProvider.examQuizes[index],onTap: (){
                          Navigator.push(context, CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context)=>QuizDetailsScreen(id: quizProvider.examQuizes[index].id))
                        );
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
