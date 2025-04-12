import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/colors.dart';


class GradientButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const GradientButton({super.key,required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          gradient: const LinearGradient(colors: [
            ThemeColors.primaryBlueColor,
            Colors.blueAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          color: ThemeColors.primaryBlueColor),
      child: Material(
        color: Colors.transparent,

        child: InkWell(
          borderRadius: BorderRadius.circular(1000),
          highlightColor: Colors.transparent,
          splashColor: Colors.black12,
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.white, letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
