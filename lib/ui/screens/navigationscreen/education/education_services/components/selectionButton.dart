import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;
  const SelectionButton({super.key, required this.label, this.onTap, this.buttonColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 52,
      decoration: BoxDecoration(
          color: buttonColor ?? Colors.blue.shade100,
          borderRadius: BorderRadius.circular(1000)
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1000),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.white.withOpacity(.2),
          onTap: onTap,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.normal,color: textColor ?? Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
          ),
              )),
        ),
      ),
    );
  }
}
