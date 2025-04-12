import 'package:flutter/material.dart';
import 'package:payapp/core/views/kslistviewbuilder.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/rechargeservices/dth/subescriberidscreen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/dthoperatortile.dart';
import 'package:payapp/ui/widgets/headingtile.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/rechargeServiceProvider.dart';

class DthRecharge extends StatefulWidget {

  const DthRecharge({super.key});

  @override
  State<DthRecharge> createState() => _DthRechargeState();
}

class _DthRechargeState extends State<DthRecharge> {
  final rechargeServiceProvider = RechargeServicesProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rechargeServiceProvider.loading = true;
    // rechargeServiceProvider.getDthOperators();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => rechargeServiceProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: const AppBarWidget(
          title: "Select Provider", size: 55,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),

              child: Consumer<RechargeServicesProvider>(
                  builder: (context, rechargeServiceProvider, child) {
                    return rechargeServiceProvider.dthOperators.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : KSListView(scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: rechargeServiceProvider.dthOperators.length +
                            1,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        separateSpace: 5,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? const HeadingTile(title: "All Billers")
                              : DthOperatorsTile(
                            dthOperatorModel: rechargeServiceProvider
                                .dthOperators[index - 1],
                            onTap: ()async{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SubescriberIdScreen(dthOperatorModel:rechargeServiceProvider.dthOperators[index-1],rechargeServicesProvider:rechargeServiceProvider)));
                            },
                          );
                        });
                  }),
            ),
          ),)
        ,
      ),
    );
  }
}
