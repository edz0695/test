import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/detailswidget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../../themes/colors.dart';


class TeacherProfileEdit extends StatefulWidget {
  final String id;
  const TeacherProfileEdit({super.key,required this.id});

  @override
  State<TeacherProfileEdit> createState() => _TeacherProfileEditState();
}

class _TeacherProfileEditState extends State<TeacherProfileEdit> {
  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('mygromoapp:SacPass112233'))}';

  Future<Map> fetchAllLeads(BuildContext context) async {
    final pro  = Provider.of<LoginSignUpProvider>(context,listen: false);
    var url = Uri.parse("https://sambhavapps.com/admin/api/teacherprofile/${widget.id}");
    final http.Response response =
    await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData['profile'] as List;
      printThis(widget.id);
      return  responseData['profile'][0];
    } else {
      return{};
    }
  }
  late var _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    printThis("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    printThis("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    printThis("Payment Fail");
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: "Profile",size: 55,),

      body:  FutureBuilder<Map>(
          future: fetchAllLeads(context),
          builder: (_, snapshot) {
            if(snapshot.hasData){
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Column(
                        children: [
                          DetailsWidget(title: "Name", detail: snapshot.data!['name']??""),
                          DetailsWidget(title: "Email", detail: snapshot.data!['email']??""),
                          DetailsWidget(title: "Mobile", detail: snapshot.data!['mobile']??""),
                          DetailsWidget(title: "bio", detail: snapshot.data!['name']??""),
                        ],
                      ),
                    ),
                  ),

                  Material(
                    color: ThemeColors.primaryBlueColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(.2),
                      highlightColor: Colors.transparent,
                      onTap: () async {
                      },
                      child: Container(
                        height: 62,
                        decoration: const BoxDecoration(
                          // color: ThemeColors.blueColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }

            return const Center(child: CircularProgressIndicator(),);
          })
    );
  }
}
