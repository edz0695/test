import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../models/rechargeservicesmodels/dth/dthoperatormodel.dart';
import '../../../../../../provider/rechargeServiceProvider.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/app_bar_widget.dart';


class AmountScreen extends StatefulWidget {
  final RechargeServicesProvider rechargeServicesProvider;
  final DthOperatorModel dthOperatorModel;
  final String subscriberID;
  const AmountScreen({super.key,required this.rechargeServicesProvider,required this.dthOperatorModel,required this.subscriberID});

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.rechargeServicesProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: const AppBarWidget(
          title: "DTH Recharge", size: 55,
        ),
        body: SafeArea(
          child: Column(
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 60,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://9to5google.com/wp-content/uploads/sites/4/2022/02/flutter-windows-promo.jpg?quality=82&strip=all&w=1600")),
                        const SizedBox(width: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.dthOperatorModel.name,style: GoogleFonts.poppins(),),
                            Text(widget.subscriberID,style: GoogleFonts.poppins(color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(height: 10,),
                    TextField(
                      textAlign: TextAlign.left,
                      maxLength: 12,autofocus: true,
                      // controller: commentController,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500, ),
                      cursorColor: ThemeColors.primaryBlueColor,
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      inputFormatters: [
                        // LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,


                        contentPadding: const EdgeInsets.symmetric(
                            vertical:20, horizontal: 15),
                        hintText: 'Enter Amount',
                        prefixText: "₹ ",
                        counterText: "",
                        hintStyle: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.normal,),
                        errorStyle: GoogleFonts.ubuntu(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ThemeColors.blueColor1),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Material(
                color: ThemeColors.primaryBlueColor,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.white24,
// splashColor: ,
                  onTap: () {},
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
              ),
            ],
          ),)
        ,
      ),
    );
  }
}
