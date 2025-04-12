import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/utils/validator/validator.dart';

import '../../themes/colors.dart';

class RechargeFormFieldWidget extends StatefulWidget {
  final String title;
  final String? detail;
  final TextEditingController  editingController;
  String? Function(String? value)? validator;
  final String? validationType;
  RechargeFormFieldWidget({super.key,required this.title ,this.detail,required this.editingController,this.validator,this.validationType});

  @override
  State<RechargeFormFieldWidget> createState() => _EditDetailsWidgetState();
}

class _EditDetailsWidgetState extends State<RechargeFormFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.editingController.value = TextEditingValue(text: widget.detail??"");
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 15,),
        TextFormField(
          textAlign: TextAlign.left,
          controller: widget.editingController,
          validator: (value){
            if (widget.validationType?.toUpperCase()=="MOBILE"){
              return FormValidator.validateMobile(value);
            }
            if(widget.validationType?.toUpperCase()=="EMAIL"){
              return FormValidator.validateEmail(value);
            }
            return null;

          },
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * .05,
              letterSpacing: 1,
              fontWeight: FontWeight.normal),
          onChanged: (value){
          },
          maxLines: null,
          cursorColor: ThemeColors.blueColor1,
          inputFormatters: const [

            // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,


            contentPadding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 15),
            // hintText: 'Subscriber Number',
            counterText: "",
            labelText: widget.title.toUpperCase(),
            labelStyle: const TextStyle(color: ThemeColors.blueColor1),
            hintStyle: GoogleFonts.ubuntu(
              fontWeight: FontWeight.normal,
            ),
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
      ],
    );
  }
}
