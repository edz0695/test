import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/rechargeservices/dth/amountscreen.dart';
import 'package:provider/provider.dart';

import '../../../../../../models/rechargeservicesmodels/dth/dthoperatormodel.dart';
import '../../../../../../provider/rechargeServiceProvider.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/dthoperatortile.dart';


class SubescriberIdScreen extends StatefulWidget {
  final RechargeServicesProvider rechargeServicesProvider;
  final DthOperatorModel dthOperatorModel;
  const SubescriberIdScreen({super.key,required this.rechargeServicesProvider,required this.dthOperatorModel});

  @override
  State<SubescriberIdScreen> createState() => _SubescriberIdScreenState();
}

class _SubescriberIdScreenState extends State<SubescriberIdScreen> {
  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.rechargeServicesProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        appBar: AppBarWidget(
          title: widget.dthOperatorModel.name, size: 55,
        ),
        body: SafeArea(
          child: Column(
            children: [
              DthOperatorsTile(
                dthOperatorModel:widget.dthOperatorModel,

              ),
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
                      TextField(
                        textAlign: TextAlign.left,
                        maxLength: 12,autofocus: true,
                        controller: idController,
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
                              vertical:15, horizontal: 15),
                          hintText: 'Subscriber Number',
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
                      Text("Enter your Subscriber Number",style: GoogleFonts.poppins(),),const SizedBox(height: 10,)
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AmountScreen(dthOperatorModel:widget.dthOperatorModel,rechargeServicesProvider:widget.rechargeServicesProvider, subscriberID: idController.text,)));
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
              ),
            ],
          ),)
        ,
      ),
    );
  }
}
