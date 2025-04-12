import 'package:flutter/material.dart';

import '../../../../../../themes/colors.dart';
import 'walletCardIcon.dart';

class WalletCard extends StatefulWidget {
  final String walletBalance;
  final String walletCurrency;
  const WalletCard(
      {super.key, required this.walletBalance, required this.walletCurrency});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      color: ThemeColors.blueColor1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(children: [
          const Row(
            children: [
              Icon(
                Icons.wallet,
                color: ThemeColors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Your wallet Balance",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: ThemeColors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                widget.walletCurrency,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.white),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.walletBalance,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.white),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.visibility_off_outlined,
                color: ThemeColors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WalletCardIcon(icon: Icons.currency_rupee, text: "Balance"),
              WalletCardIcon(icon: Icons.send_to_mobile, text: "Send"),
              WalletCardIcon(
                  icon: Icons.question_mark_outlined, text: "Request"),
              WalletCardIcon(
                  icon: Icons.send_time_extension_rounded, text: "Transfer"),
              WalletCardIcon(icon: Icons.history, text: "History"),
            ],
          )
        ]),
      ),
    );
  }
}
