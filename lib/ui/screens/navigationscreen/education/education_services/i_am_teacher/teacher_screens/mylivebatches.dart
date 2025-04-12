import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../widgets/app_bar_widget.dart';
import '../../../../../../widgets/batchwidgets/batchwidget.dart';

class MyLiveBatches extends StatefulWidget {
  const MyLiveBatches({super.key});

  @override
  State<MyLiveBatches> createState() => _MyLiveBatchesState();
}

class _MyLiveBatchesState extends State<MyLiveBatches> {
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
    return Scaffold(
      appBar: const AppBarWidget(title: "Details",size: 55,),
    body: SafeArea(
    child: Column(
        children: [
          Consumer<EductionFormProvider>(
              builder: (context, batchProvider, child) {
                return batchProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
                    itemCount: batchProvider.batchList.length,
                    itemBuilder: (context, index) {
                      return BatchTile(batch: batchProvider.batchList[index],onTap: (){});
                    }
                );
              }

          ),
        ],
    ),
    ),
    );
  }
}
