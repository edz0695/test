import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/quize/quizedetailswidget.dart';

class QuizDetailsScreen extends StatefulWidget {
  final String id;

  const QuizDetailsScreen({super.key, required this.id});

  @override
  State<QuizDetailsScreen> createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  @override
  @override
  void initState() {
    super.initState();
    final quizDetailProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    quizDetailProvider.getQuizeDetails(quize_id: widget.id);
    quizDetailProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: "Quizes Questions",
          size: 55,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Consumer<EductionFormProvider>(
                  builder: (context, quizeDetailProvider, child) {
                    return quizeDetailProvider.isLoadingCategorised
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
                            itemCount: quizeDetailProvider.quizeDetails.length,
                            itemBuilder: (context, index) {
                              return QuizDetailsWidget(
                                quizDetails:
                                    quizeDetailProvider.quizeDetails[index],
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
