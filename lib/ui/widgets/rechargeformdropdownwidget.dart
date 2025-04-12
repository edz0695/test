import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/print_text.dart';

import '../../themes/colors.dart';

class RechargeFormDropDownWidget extends StatefulWidget {
  final String initialValue;
  final List<String> dropDownList;
  String? selected;
  RechargeFormDropDownWidget(
      {super.key,
      required this.initialValue,
      required this.dropDownList,
      this.selected});

  @override
  State<RechargeFormDropDownWidget> createState() =>
      _RechargeFormDropDownWidgetState();
}

class _RechargeFormDropDownWidgetState
    extends State<RechargeFormDropDownWidget> {
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: GoogleFonts.getFont("Montserrat",
              color: Colors.black87, fontSize: 13),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ThemeColors.blueColor1, width: 2)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            hint: Text(
              widget.initialValue.toUpperCase(),
              style:
                  const TextStyle(color: ThemeColors.blueColor1, fontSize: 12),
            ),
            isExpanded: true,
            borderRadius: BorderRadius.circular(10.0),
            iconSize: 30,
            elevation: 2,
            icon:  Icon(
              Icons.arrow_downward,
            ),
            value: widget.selected,
            items: widget.dropDownList.map(buildMenuItem).toList(),
            onChanged: (value) {
              setState(() {
                widget.selected = value;
              });

              printThis(value);
            }),
      ),
    );
  }
}
