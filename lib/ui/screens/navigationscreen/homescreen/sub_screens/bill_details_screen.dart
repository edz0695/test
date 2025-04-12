import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/bill_model.dart';
import 'package:payapp/models/operatormodel.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../../../provider/rechargeServiceProvider.dart';
import '../../../../../themes/colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/headingtile.dart';
import '../../../../widgets/operatortile.dart';



class BillDetailsScreen extends StatefulWidget {
  final BillModel billModel;
  final OperatorModel operatorModel;
  final RechargeServicesProvider rechargeServicesProvider;
  const BillDetailsScreen({super.key,required this.billModel,required this.operatorModel,required this.rechargeServicesProvider});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  String body = "";
  String callback = "https://webhook.site/b7ad762c-b0e7-4772-a603-c9ec045b6b54";
  String checksum = "";

  Map<String, String> headers = {};
  List<String> environmentList = <String>['SANDBOX', 'PRODUCTION'];
  bool enableLogs = true;
  Object? result;
  String environmentValue = 'SANDBOX';
  String appId = "";
  String merchantId = "PGTESTPAYUAT86";
  String packageName = "com.sambhavapps.sambhav";
  String saltKey="96434309-7796-489d-8924-ab56988a6076";
  int saltIndex=1;
  String apiEndPoint = "/pg/v1/pay";

  @override
  void initState() {
    phonepeInit();
    body=getCheckSum().toString();
    super.initState();
  }

  void phonepeInit() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogs)
        .then((val) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $val';
      })
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  Future startTransaction()async{
    body =  getCheckSum().toString();
    print(body);
    PhonePePaymentSdk.startTransaction(body, callback, checksum, packageName).then((response) => {
      setState(() {
        if (response != null)
        {
          String status = response['status'].toString();
          String error = response['error'].toString();
          if (status == 'SUCCESS')
          {
            result= "Flow Completed - Status: Success!";
          }
          else {
            result= "Flow Completed - Status: $status and Error: $error";
          }
        }
        else {
          result= "Flow Incomplete";
        }
      })
    }).catchError((error) {
      // handleError(error)
      return <dynamic>{};
    });
  }

  String generateRandomString(int length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();

    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  String getCheckSum()  {
   print(" widget.billModel.amount.toInt()");
   print( widget.billModel.amount.toInt());
    final data = {
      "merchantId": merchantId,
      "merchantTransactionId": generateRandomString(18),
      "merchantUserId": "MUID123",/// user email/userId
      "amount": widget.billModel.amount.toInt(),
      "callbackUrl": callback,
      "mobileNumber": "9999999999",
      "paymentInstrument": {
        "type": "PAY_PAGE"
      }
    };
    String base64Body = base64.encode(utf8.encode(json.encode(data)));

    checksum =
    '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey))
        .toString()}###$saltIndex';

    return base64Body;
  }

  void handleError(error) {
    result=error;
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.rechargeServicesProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: const AppBarWidget(
          title: "Pay",
          size: 55,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingTile(title: "Operator Details"),
                    const SizedBox(
                      height: 10,
                    ),
                    OperatorsTile(
                      operatorModel: widget.operatorModel,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const HeadingTile(title: "Bill Details"),
                    Consumer<RechargeServicesProvider>(builder: (context, rechargeServiceProvider, child) {
                      return Container(
                        width:double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            Row(
                              children: [
                                Expanded(child: Text("Consumer Name",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                Text(" : ",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                Expanded(child: Text(widget.billModel.accountHolderName,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(child: Text("Bill Date",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                Text(" : ",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                Expanded(child: Text(widget.billModel.billDate,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                            const SizedBox(height: 10,),

                            Text(" ₹  ${widget.billModel.amount}",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                            // Text("Bill Date : ${widget.billModel.billDate}",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),),
                            Text("Due Date : ${widget.billModel.dueDate}",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.red),),

                          ],),
                      );
                    }),
                    const SizedBox(height: 20,),
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
                        onTap:(){
                          startTransaction();
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000)),
                          child: Center(
                            child: Text(
                              "Proceed To Pay".toUpperCase(),
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
}
