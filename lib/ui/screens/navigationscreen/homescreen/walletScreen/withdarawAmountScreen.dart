import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

import '../../../../../models/bank_model.dart';
import '../../../../../themes/colors.dart';
import '../../../../widgets/rechargeformfieldwidget.dart';


class WithdrawAmountScreen extends StatefulWidget {
  final BankModel bankModel;
  const WithdrawAmountScreen({super.key,required this.bankModel});

  @override
  State<WithdrawAmountScreen> createState() => _WithdrawAmountScreenState();
}

class _WithdrawAmountScreenState extends State<WithdrawAmountScreen> {
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: const AppBarWidget(
        title: "Pay",
        size: 55,
      ),
      body: Column(
        children: [


          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.all(),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100

                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const Padding(
                       padding: EdgeInsets.all(10),
                       child: Icon(Icons.account_balance_outlined,color: ThemeColors.primaryBlueColor,size: 30,),
                     ),
                      const SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.bankModel.accountHolderName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.bankModel.accountNumber,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: .5,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.bankModel.bankName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.bankModel.ifscCode,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                RechargeFormFieldWidget(title: "Enter Amount", editingController: _amountController),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Material(
            color: ThemeColors.primaryBlueColor,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.white24,
              onTap:(){

              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000)),
                child: Center(
                  child: Text(
                    "WithDraw".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
