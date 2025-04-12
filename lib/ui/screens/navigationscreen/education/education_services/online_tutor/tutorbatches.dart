import 'package:flutter/material.dart';
import 'package:payapp/provider/education_providers/education_provider.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/online_tutor/tutorwidgets/batchtile.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class TutorBatches extends StatefulWidget {
  final String id;

  const TutorBatches({super.key, required this.id});

  @override
  State<TutorBatches> createState() => _TutorBatchesState();
}

class _TutorBatchesState extends State<TutorBatches> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EductionFormProvider>(context, listen: false);
    provider.getBatches(userId: widget.id);
    provider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Batches",
        size: 55,
      ),
      body: Consumer<EductionFormProvider>(
          builder: (context, batchProvider, child) {
        return batchProvider.isLoadingCategorised
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                itemCount: batchProvider.batchList.length,
                itemBuilder: (context, index) {
                  return TutorBatchTile(batch: batchProvider.batchList[index]);
                });
      }),
    );
  }
}
