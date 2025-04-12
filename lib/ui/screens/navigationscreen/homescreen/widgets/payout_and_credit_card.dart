import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/animations/slide_animation.dart';
import '../../../../../core/animations/wave_animation.dart';
import '../../../../widgets/box_button_widget.dart';
import '../payout/payoutScreen.dart';

class PayoutAndCreditCardRow extends StatelessWidget {
  const PayoutAndCreditCardRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SlideAnimation(
          fromLeft: 2,
          child: BoxButtonWidget(
            pngIconPath: 'assets/images/homescreen/add_fund.png',
            title: "Payout",
            iconData: Icons.money,
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const PayoutScreen()));
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 5,
                  ),
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff2057A6),
                      Colors.blue,
                    ],
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Credit Card',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Get your own credit\ncard with our service',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Lottie.asset(
                        'assets/lottie/credit-card.json',
                        height: 70,
                      ))
                    ],
                  ),
                ),
                const Positioned(
                    bottom: -25, left: 0, right: 0, child: WaterEffect()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
