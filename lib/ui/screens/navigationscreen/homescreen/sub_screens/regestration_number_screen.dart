import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/sub_screens/bill_details_screen.dart';
import 'package:payapp/ui/widgets/rechargeformdropdownwidget.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../../../models/operatormodel.dart';
import '../../../../../provider/rechargeServiceProvider.dart';
import '../../../../../themes/colors.dart';
import '../../../../dialogs/loaderdialog.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/headingtile.dart';
import '../../../../widgets/operatortile.dart';
import '../../../../widgets/rechargeformfieldwidget.dart';

class IdInputScreen extends StatefulWidget {
  final RechargeServicesProvider rechargeServicesProvider;
  final OperatorModel operatorModel;
  final String label;
  final String serviceType;

  const IdInputScreen(
      {super.key,
      required this.rechargeServicesProvider,
      required this.operatorModel,
        required this.serviceType,
      required this.label});

  @override
  State<IdInputScreen> createState() => _IdInputScreenState();
}

class _IdInputScreenState extends State<IdInputScreen> {
  final idController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: GoogleFonts.getFont("Montserrat",
              color: Colors.black87, fontSize: 15),
        ),
      );
  String? selected;

  final List formFields = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in widget.operatorModel.customerParameters) {

      if (element.values.isNotEmpty) {
        formFields.add(RechargeFormDropDownWidget(
          dropDownList: element.values,
          initialValue: element.paramName,
        ));
      } else {
        formFields.add(RechargeFormFieldWidget(
          title: element.paramName,
          editingController: element.controller??TextEditingController(),
          validationType: "",
        ));
      }
    }
  }

  TextEditingController consumerName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.rechargeServicesProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: AppBarWidget(
          title: widget.operatorModel.name,
          size: 55,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingTile(title: "Operator Details"),
                    const SizedBox(
                      height: 10,
                    ),
                    OperatorsTile(
                      operatorModel: widget.operatorModel,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        RechargeFormFieldWidget(
                          title: "Nickname",
                          editingController: consumerName,
                          validationType: "",
                        ),
                        SizedBox(
                          height:(formFields.length)*75,
                          child: ListView.builder(
                              itemCount: formFields.length,
                              itemBuilder: (context,index){
                            return formFields[index];
                          }),
                        )
                        
                      ]
                    ),
                    // TextField(
                    //   textAlign: TextAlign.left,
                    //   maxLength: 12,
                    //   autofocus: true,
                    //   controller: idController,
                    //   style: GoogleFonts.ubuntu(
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    //   cursorColor: ThemeColors.blueColor,
                    //   keyboardType: TextInputType.number,
                    //   maxLines: null,
                    //   inputFormatters: [
                    //     // LengthLimitingTextInputFormatter(10),
                    //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    //   ],
                    //   decoration: InputDecoration(
                    //     isDense: true,
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         vertical: 15, horizontal: 15),
                    //     // hintText: 'Subscriber Number',
                    //     counterText: "",
                    //     labelText: widget
                    //         .operatorModel.customerParameters[0].paramName
                    //         .toUpperCase(),
                    //     labelStyle: TextStyle(color: ThemeColors.bluecolor),
                    //     hintStyle: GoogleFonts.ubuntu(
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //     errorStyle: GoogleFonts.ubuntu(),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(10)),
                    //       borderSide: BorderSide(
                    //         color: Colors.grey.withOpacity(0.2),
                    //       ),
                    //     ),
                    //     focusedBorder: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       borderSide: BorderSide(color: ThemeColors.bluecolor),
                    //     ),
                    //     border: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //     errorBorder: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //   ),
                    // ),
                    // widget.operatorModel.customerParameters[0].values
                    //     .isEmpty
                    //     ? Container()
                    //     :Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(
                    //           color: ThemeColors.bluecolor, width: 2)),
                    //   child:  DropdownButtonHideUnderline(
                    //           child: DropdownButton<String>(
                    //               hint: Text(
                    //                 widget.operatorModel.customerParameters[0]
                    //                     .paramName.toUpperCase(),
                    //                 style: TextStyle(color: ThemeColors.bluecolor),
                    //               ),
                    //               isExpanded: true,
                    //               borderRadius: BorderRadius.circular(10.0),
                    //               iconSize: 30,
                    //               elevation: 2,
                    //               icon: const Icon(
                    //                 Iconsax.arrow_down_1,
                    //               ),
                    //               value: selected,
                    //               items: widget.operatorModel
                    //                   .customerParameters[0].values
                    //                   .map(buildMenuItem)
                    //                   .toList(),
                    //               onChanged: (value) {
                    //                 selected = value;
                    //                 printThis(text)(value);
                    //               }),
                    //         ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Consumer<RechargeServicesProvider>(
                  builder: (context, rechargeServiceProvider, child) {
                return Material(
                  color: ThemeColors.primaryBlueColor,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white24,
// splashColor: ,
                    onTap: () async {
                      showLoaderDialog(context);
                      var customerParameters = formFields.map((i) {
                        //i.controller.text.trim();
                        if (i.runtimeType == RechargeFormDropDownWidget) {
                          printThis(
                              "these are the listOfTextEntries ${i.selected}");
                          return {
                            'name': i.initialValue.toString(),
                            'value': i.selected.toString()
                          };
                        } else {
                          printThis("Value: ${i.editingController.text}");
                          return {
                            'name': i.title.toString(),
                            'value': i.editingController.text.toString()
                          };
                        }
                      }).toList();

                      Map<String, dynamic> data = {};

                      Map<String, String> result = {};

                      for (var item in customerParameters) {
                        result[item["name"]!] = item["value"]!;
                      }
                      print(widget.serviceType);
                      data["mobileNo"] = "9918833123";
                      data["billerId"] = widget.operatorModel.id;
                      data["category"] = "CREDIT CARD";
                      data["customerParams"] = result;
                      data['merchantTrxnRefId']="12345678900000000000111111111111111";
                      data['consumer Name']=consumerName.text;

                        printThis("this");
                        final bill =
                            await rechargeServiceProvider.getBill(data: data);
                        if (bill != null) {
                          Navigator.pop(context);
                          printThis(bill.amount);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BillDetailsScreen(
                                        billModel: bill,
                                        operatorModel: widget.operatorModel,
                                        rechargeServicesProvider:
                                            widget.rechargeServicesProvider,
                                      )));
                        } else {
                          Helper.showScaffold(context, "No Bill Dues.");
                        }
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000)),
                      child: Center(
                        child: Text(
                          "Confirm".toUpperCase(),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  String generateRandomNumberString(int length) {
    Random random = Random();
    String randomNumberString = '';

    for (int i = 0; i < length; i++) {
      randomNumberString += random.nextInt(10).toString(); // Generate a random digit between 0 and 9
    }

    return randomNumberString;
  }
}
