import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/utils/validator/validator.dart';

import '../../themes/colors.dart';

class FormFieldWidget extends StatefulWidget {
  final String title;
  final String? detail;
  final TextEditingController  editingController;
  String? Function(String? value)? validator;
  final String? validationType;
  final Color? fillColor;
  FormFieldWidget({super.key,required this.title ,this.detail,required this.editingController,this.validator,this.validationType,this.fillColor});

  @override
  State<FormFieldWidget> createState() => _EditDetailsWidgetState();
}

class _EditDetailsWidgetState extends State<FormFieldWidget> {
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

        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 15),
          child: Text(
          "${widget.title[0].toUpperCase()}${widget.title.substring(1).toLowerCase()}",
            // widget.title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff184070),
            ),
          ),
        ),
        const SizedBox(height: 7,),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
          ),
          child: TextFormField(
            textAlign: TextAlign.left,
            controller: widget.editingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value){
              if (widget.validationType?.toUpperCase()=="MOBILE"){
                return FormValidator.validateMobile(value);
              }
              else if(widget.validationType?.toUpperCase()=="EMAIL"){
                return FormValidator.validateEmail(value);
              }
              else{
                if(value!=null&&value.isNotEmpty){
                  return null;
                }
                return "${widget.title} can't be empty.";
              }

            },
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * .05,
                letterSpacing: 1,
                fontWeight: FontWeight.normal),
            onChanged: (value){
            },
            inputFormatters: [],
            cursorColor: ThemeColors.blueColor1,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15),
              // hintText: widget.title.toUpperCase(),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
                borderSide:
                BorderSide(color: ThemeColors.primaryBlueColor),
              ),
              border: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
