import 'package:flutter/cupertino.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/payout/payoutForm.dart';

import '../../../../../../src/src.dart';

class WalletBalanceCardWidget extends StatelessWidget {
  const WalletBalanceCardWidget({
    super.key,
    required this.balance,
    this.isPayout = false,
  });

  final double balance;
  final bool? isPayout;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(14),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 15,
                    color: ThemeColors.blueColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "₹${balance.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 24,
                    color: ThemeColors.blueColor1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height(10),
                isPayout!
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => PayoutForm(
                                        showForm: true,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ).copyWith(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (states) => Colors.transparent,
                          ),
                          elevation: WidgetStateProperty.all(0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: ThemeColors.blueColor1,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              const BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 10),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                              maxWidth: 125,
                              minHeight: 50,
                            ),
                            child: const Text(
                              "Withdraw",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Image.asset(
              "assets/images/wallet_add.jpg",
              height: 150,
              width: 155,
            )
          ],
        ));
  }
}
