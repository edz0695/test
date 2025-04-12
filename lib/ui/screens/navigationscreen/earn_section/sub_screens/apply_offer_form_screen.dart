import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/provider/earn_providers/earn_screen_provider.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../core/utils/helper/helper.dart';
import '../../../../../services/apis/apiservice.dart';
import '../../../../../themes/colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/datePickerWidget.dart';
import '../../../../widgets/imagePickerWidget.dart';

class FormScreen extends StatefulWidget {
  // final String id;
  // final String amount;

  const FormScreen({
    super.key,
    // required this.id,
    // required this.amount
  });

  @override
  State<FormScreen> createState() => _CaFormScreenState();
}

class _CaFormScreenState extends State<FormScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late var _razorpay;

  @override
  void initState() {

    super.initState();
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // final provider = Provider.of<CaServicesProvider>(context,listen: false);
    // for(var element in formParameters){
    //       formFields.add(FormFieldWidget(
    //         title: element.label,
    //         editingController: TextEditingController(),
    //         validator: (value)=>FormValidator.validateMobile(value),validationType: element.validation,
    //       ));
    //     }
    // provider.getServiceForm(id: widget.id);
    // provider.isLoadingForm=true;
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade50,
      appBar: const AppBarWidget(title: "Form", size: 55),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Consumer<EarnScreenProvider>(
                    builder: (context, earnScreenProvider, child) {
                  return earnScreenProvider.isLoadingOffer
                      ? const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            addAutomaticKeepAlives: true,
                            children: List.generate(
                                earnScreenProvider.formFields.length, (index) {
                              return earnScreenProvider.formFields[index];
                            }),
                          ),
                        );
                  // ListView.separated(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  //   separatorBuilder: (context,index){
                  //     return SizedBox(height: 15,);
                  //   },
                  //   physics: BouncingScrollPhysics(
                  //       parent: AlwaysScrollableScrollPhysics()),
                  //   itemCount: caServiceProvider.formParameters.length+1,
                  //   itemBuilder: (context, index) {
                  //     final controller = TextEditingController();
                  //     return index==caServiceProvider.formParameters.length?Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           height: 50,
                  //           width: 150,margin: EdgeInsets.only(top: 20),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(1000),
                  //               gradient: const LinearGradient(
                  //                   colors: [
                  //                     ThemeColors.blueColor,
                  //                     Colors.blueAccent,
                  //                   ],
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight),
                  //               color: ThemeColors.blueColor),
                  //           child: Material(
                  //             color: Colors.transparent,
                  //             child: InkWell(
                  //               borderRadius: BorderRadius.circular(1000),
                  //               highlightColor: Colors.transparent,
                  //               splashColor: Colors.black12,
                  //               onTap: () {},
                  //               child: Center(
                  //                 child: Text(
                  //                   "Submit",
                  //                   style: GoogleFonts.poppins(
                  //                       color: Colors.white, letterSpacing: 1),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ):FormFieldWidget(title: caServiceProvider.formParameters[index].label,editingController: controller,);
                  //   },
                  // );
                }),
              ),
            ),
            Consumer<EarnScreenProvider>(
                builder: (context, caServiceProvider, child) {
              return Material(
                color: ThemeColors.primaryBlueColor,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.white24,
                  onTap: () async {
                    // showLoaderDialog(context);
                    if (formKey.currentState!.validate()) {
                      var customerParameters =
                          caServiceProvider.formFields.map((i) {
                        //i.controller.text.trim();
                        if (i.runtimeType == ImagePickerWidget) {
                          // printThis(text)("these are the listOfTextEntries ${i.selected}");
                          return {
                            'type': 'file',
                            "name": i.label,
                            "value": i.pickedFile!
                          };
                        } else if (i.runtimeType == DatePickerWidget) {
                          return {
                            'type': 'text',
                            "name": i.label,
                            "value": i.pickedDate!
                          };
                        } else {
                          printThis("Value : " + i.editingController.text);
                          return {
                            'type': 'text',
                            'name': i.title.toString(),
                            'value': i.editingController.text.toString()
                          };
                        }
                      }).toList();
                      printThis(customerParameters.toList());
                      final provider = Provider.of<LoginSignUpProvider>(context,
                          listen: false);
                      if (provider.userModel != null) {
                        Map<String, dynamic> data = {};
                        data["user_id"] = provider.userModel!.id;
                        data["offer_id"] = caServiceProvider.offer!.id;
                        data["form_data"] = customerParameters;
                        final value =
                            await ApiService.submitEarnForm(data: data)
                                .then((value) {
                          printThis(value);
                          Navigator.pop(context);
                        });
                      } else {
                        Helper.showScaffold(context, "Please Login ");
                      }
                      // }

                      // var options = {
                      //   'key': "rzp_test_xvlZZBGCo0SzL0",
                      //   // amount will be multiple of 100
                      //   'amount': (int.parse("2000") * 100)
                      //       .toString(), //So its pay 500
                      //   'name': 'Code With Patel',
                      //   'description': 'Demo',
                      //   'timeout': 300, // in seconds
                      //   'prefill': {
                      //     'contact': '8787878787',
                      //     'email': 'codewithpatel@gmail.com'
                      //   }
                      // };
                      // _razorpay.open(options);
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000)),
                    child: Center(
                      child: Text(
                        "SUBMIT".toUpperCase(),
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
    );
  }
}
