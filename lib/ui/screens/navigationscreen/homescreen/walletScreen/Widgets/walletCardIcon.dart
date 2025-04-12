import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class WalletCardIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const WalletCardIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: ThemeColors.backgroundLightBlue,
          child: Icon(
            icon,
            color: ThemeColors.blueColor1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors.white,
          ),
        ),
      ],
    );
  }
}
