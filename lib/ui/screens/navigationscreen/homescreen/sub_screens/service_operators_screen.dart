import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/operatormodel.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/sub_screens/regestration_number_screen.dart';
import 'package:payapp/ui/widgets/operatortile.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../core/views/kslistviewbuilder.dart';
import '../../../../../provider/rechargeServiceProvider.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/headingtile.dart';

class ServiceOperatorsScreen extends StatefulWidget {
  final String appBarTitle;
   String serviceType;
   ServiceOperatorsScreen({super.key,required this.appBarTitle, required this. serviceType});

  @override
  State<ServiceOperatorsScreen> createState() => _ServiceOperatorsScreenState();
}

class _ServiceOperatorsScreenState extends State<ServiceOperatorsScreen> {
  final rechargeServiceProvider = RechargeServicesProvider();
  List<OperatorModel> filterList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rechargeServiceProvider.loading = true;
    print(widget.serviceType);
    if(widget.serviceType=="credit-card"){

      if(mounted){
        widget.serviceType="CREDIT CARD";
        setState(() {

        });
      }
    }
    else if(widget.serviceType=="broadband-postpaid"){
      if(mounted){
        widget.serviceType="BROADBAND POSTPAID";
        setState(() {

        });
      }
    }
    rechargeServiceProvider.getBillerAllDetailsByCategoryName(serviceType:widget.serviceType);
    rechargeServiceProvider.loading = false;
  }

  bool isFilterListEmpty=false;
  bool isQueryEmpty=true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => rechargeServiceProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: AppBarWidget(
          title:widget.appBarTitle ,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Consumer<RechargeServicesProvider>(builder: (context, rechargeServiceProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField<OperatorModel>(
                  searchInputDecoration:SearchInputDecoration(
                    filled: true,
                    hintStyle: GoogleFonts.poppins(color: Colors.grey,fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(1000),),

                  ),
                  onSearchTextChanged: (query) {
                    if(query==""){
                      isFilterListEmpty=true;
                      filterList=[];
                      isQueryEmpty=true;
                      setState(() {

                      });

                    }
                    else{

                      filterList = rechargeServiceProvider.operators
                          .where((element) =>
                      (element.name.toLowerCase().contains(query.toLowerCase())))
                          .toList();
                      setState(() {

                      });
                      if(filterList.isEmpty && query!=""){
                        isFilterListEmpty=true;
                        filterList=[];
                        isQueryEmpty=false;
                        setState(() {

                        });
                      }
                    }
                    return null;

                  },
                  onTap: () async {
                  },
                  /// widget to show when suggestions are empty
                  hint: 'Search by Name',

                  itemHeight: 50,
                  scrollbarDecoration: ScrollbarDecoration(),
                  suggestionStyle: const TextStyle(fontSize: 24, color: Colors.white),

                  suggestionState: Suggestion.expand, suggestions: [],
                ),
              );
            }),
          ),
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
                    return rechargeServiceProvider.operators.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        :filterList.isNotEmpty? KSListView(scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: filterList.length,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        separateSpace: 5,
                        itemBuilder: (context, index) {
                          return  OperatorsTile(
                            operatorModel: filterList[index],
                            onTap: ()async{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => IdInputScreen(operatorModel:filterList[index],rechargeServicesProvider:rechargeServiceProvider,label: "",serviceType: widget.serviceType,)));
                            },
                          );
                        }): (!isQueryEmpty && filterList.isEmpty)?Center(child:Text("No Data Found")) :

                    KSListView(scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: rechargeServiceProvider.operators.length +
                            1,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        separateSpace: 5,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? const HeadingTile(title: "All Billers")
                              : OperatorsTile(
                            operatorModel: rechargeServiceProvider
                                .operators[index - 1],
                            onTap: ()async{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => IdInputScreen(operatorModel:rechargeServiceProvider.operators[index-1],rechargeServicesProvider:rechargeServiceProvider,label: "",serviceType: widget.serviceType,)));
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
