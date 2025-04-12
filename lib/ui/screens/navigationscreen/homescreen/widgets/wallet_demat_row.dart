import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/walletScreen/walletScreen.dart';
import 'package:provider/provider.dart';
import '../../../../../core/animations/slide_animation.dart';
import '../../../../../core/animations/wave_animation.dart';
import '../../../../../data/model/body/notification_body.dart';
import '../../../../widgets/box_button_widget.dart';

class WalletAndDematAccountRow extends StatelessWidget {
  const WalletAndDematAccountRow({
    super.key,
    required this.languages,
    required this.body,
  });

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SlideAnimation(
          fromLeft: 2,
          child: BoxButtonWidget(
            pngIconPath: "assets/images/homescreen/pay.png",
            iconData: Icons.wallet,
            onTap: () {
              final loginSignupProvider =
                  Provider.of<LoginSignUpProvider>(context, listen: false);
              if (loginSignupProvider.userModel != null) {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => WalletScreen(
                              languages: languages,
                              body: body,
                            )));
              } else {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => WalletScreen(
                        languages: {},
                        body: null,
                      ),
                    ));
              }
            },
            title: "Wallet",
          ),
        ),
        const SizedBox(
          width: 10,
        ),
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
                            'Demat Account',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Open you demate\naccout with our service',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Lottie.asset(
                        'assets/lottie/card_payment.json',
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
