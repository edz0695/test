import 'package:app_links/app_links.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/util/images.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewReferral extends StatefulWidget {
  const AddNewReferral({super.key});

  @override
  State<AddNewReferral> createState() => _AddNewReferralState();
}

class _AddNewReferralState extends State<AddNewReferral> {
  late AppLinks _appLinks;

  String referralCode = '';

  /// Initialize deeplynks & listen for link data
  Future<void> init() async {
    try {
      // Get initial link
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }

      // Listen for new incoming links
      _appLinks.uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          _handleDeepLink(uri);
        }
      });
    } catch (e) {
      print('Error initializing deep links: $e');
    }
  }

  void _handleDeepLink(Uri uri) {
    setState(() {
      referralCode = uri.queryParameters['ref']!;
    });

    print('Referral Code: $referralCode');
    // Store referral code for use during signup
    _saveReferralCode(referralCode);
  }

  Future<void> _saveReferralCode(String? code) async {
    if (code != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString('referralCode', code);
      print('Saving referral code: $code');
    }
  }

  @override
  void initState() {
    _appLinks = AppLinks();
    init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String appLink =
        "https://dribbble.com/shots/3165902-Fi-Referrals?utm_source=Clipboard_Shot&utm_campaign=johnschlemmer&utm_content=Fi%20Referrals!&utm_medium=Social_Share&utm_source=Clipboard_Shot&utm_campaign=johnschlemmer&utm_content=Fi%20Referrals!&utm_medium=Social_Share";
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            Images.referral,
          ),
          const Spacer(),
          Text(
            "Invite your friends and get\nRs 250 reward each",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          /* SizedBox(height:8),
          Text(
            "Share the code below and ask them to enter\nduring they signup. Earn when your friend signs up on our app",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.6)),
          ),*/
          const SizedBox(height: 50),
          Row(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.14,
                    color: const Color(0xFF006ca5).withOpacity(0.1),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                appLink,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                            height: 25, width: 1, color: Colors.grey.shade300),
                        const SizedBox(width: 6),
                        const Text(
                          "Copy Link",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Consumer<LoginSignUpProvider>(
            builder: (context, value, child) {
             final code= value.userModel!.referCode;
              return ElevatedButton(
                onPressed: () async {
                  final link="https://sambhavapps.com/invite?ref=$code";
                   final shareData = """
Share this referral link to earn extra rewards!

$link

Join me on my referral program and earn \$50 for every new friend that joins.
""";

    await Share.share(shareData);
                  
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                  elevation: WidgetStateProperty.all(0), // Remove button shadow
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF006ca5), Color(0xFF0496C7)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 50,
                    ),
                    child: const Text(
                      "Invite Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
