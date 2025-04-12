import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key, required this.controller, this.minLines});

  TextEditingController controller;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: null,

      minLines:minLines??2,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.darkBlueColor,width: 2)
        ),
        labelText: 'Start typing here',
        border: OutlineInputBorder(),
      ),
    );
  }
}
