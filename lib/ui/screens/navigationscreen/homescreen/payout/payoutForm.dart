import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/sub_screens/comming_soon_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/formfieldwidget.dart';

import '../../../../../themes/colors.dart';

class PayoutForm extends StatefulWidget {
  final bool showForm;
  const PayoutForm({super.key,required this.showForm});

  @override
  State<PayoutForm> createState() => _PayoutFormState();
}

class _PayoutFormState extends State<PayoutForm> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final ifscController = TextEditingController();
  final amountController = TextEditingController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xffF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

          child: widget.showForm?ListView(
            children: [
            /*  CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Center(
                child:
                    Image.network(item, fit: BoxFit.cover, width: double.infinity)))
            .toList(),
      ),*/
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios,
                      size: 16, color: ThemeColors.primaryBlueColor),
                  const SizedBox(width: 8),
                  Text(
                    "Bank Transfer".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.primaryBlueColor),
                  ),
                ],
              ),
SizedBox(height:45),
              FormFieldWidget(title: "Account Holder Name", editingController: nameController),
              FormFieldWidget(title: "Account Number", editingController: numberController),
              FormFieldWidget(title: "IFSC Code", editingController: ifscController),
              FormFieldWidget(title: "Amount", editingController: amountController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 150,margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        gradient: const LinearGradient(
                            colors: [
                              ThemeColors.primaryBlueColor,
                              Colors.blueAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        color: ThemeColors.primaryBlueColor),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(1000),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.black12,
                        onTap: () {

                        },
                        child: Center(
                          child: Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                                color: Colors.white, letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ):SingleChildScrollView(
            child: Row(
              children: [
                Expanded(

                  child: Container(
                    height: 150,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1), blurRadius: 10)
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.black.withOpacity(.05),
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>const PayoutForm(showForm: true)));

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Expanded(child: Icon(Icons.account_balance,size: 40,)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Bank Transfer",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(

                  child: Container(
                    height: 150,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1), blurRadius: 10)
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.black.withOpacity(.05),
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_)=>const ComingSoonScreen(title: "Upi Payments")));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Expanded(child: Icon(Icons.account_balance,size: 40,)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "UPI Payment",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
