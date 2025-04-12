import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/colors.dart';

class EditDetailsWidget extends StatefulWidget {
  final String title;
  final String? detail;
  final bool readOnly;
  final TextEditingController editingController;
  final TextInputAction? action;
  final TextInputType? type;
  String? Function(String? value)? validator;

  EditDetailsWidget(
      {super.key,
      this.readOnly = false,
      required this.title,
      this.detail,
      required this.editingController,
      this.validator,
      this.action,
      this.type});

  @override
  State<EditDetailsWidget> createState() => _EditDetailsWidgetState();
}

class _EditDetailsWidgetState extends State<EditDetailsWidget> {
  @override
  void initState() {
    super.initState();
    widget.editingController.value = TextEditingValue(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: MediaQuery.of(context).size.width * .03,
                letterSpacing: 1,
                fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          readOnly: widget.readOnly,
          textAlign: TextAlign.left,
          controller: widget.editingController,
          textInputAction: widget.action,
          validator: widget.validator,
          keyboardType: widget.type,
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * .04,
              letterSpacing: 1,
              fontWeight: FontWeight.normal),
          onChanged: (value) {},
          inputFormatters: const [],
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          cursorColor: ThemeColors.blueColor1,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: ThemeColors.lightGrey.withOpacity(.7),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            hintText: widget.title,
            hintStyle: const TextStyle(color: Colors.black54),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ThemeColors.primaryBlueColor),
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
