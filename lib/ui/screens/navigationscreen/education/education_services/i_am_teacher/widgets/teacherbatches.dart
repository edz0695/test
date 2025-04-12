import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../widgets/batchwidgets/batchwidget.dart';

class TeacherBatches extends StatefulWidget {
  const TeacherBatches({super.key});

  @override
  State<TeacherBatches> createState() => _TeacherBatchesState();
}

class _TeacherBatchesState extends State<TeacherBatches> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final batchProvider = Provider.of<EductionFormProvider>(context,listen: false);
    final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
    batchProvider.getBatches(userId: userProvider.userModel!.id);
    batchProvider.isLoadingCategorised = true;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, batchProvider, child) {
        return batchProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
          itemCount: batchProvider.batchList.length,
          itemBuilder: (context, index) {
            return BatchTile(batch: batchProvider.batchList[index],onTap: (){});
          }
        );
      }

    );
  }
}