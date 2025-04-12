import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/animations/dot_loder_widget.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../core/utils/helper/helper.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginSignUpProvider = Provider.of<LoginSignUpProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, Future.error("Otp Not Verified."));
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Column(
                        children: [
                          Text('Verify OTP', style: GoogleFonts.ubuntu(fontSize: 18)),
                          const SizedBox(height: 45),
                          PinFieldAutoFill(
                            key: const Key("1"),
                            // focusNode: _autoFillFocus,
                            decoration: BoxLooseDecoration(
                              strokeWidth: 1,
                              strokeColorBuilder: FixedColorBuilder(Colors.grey.withOpacity(0.2)),
                              gapSpace: 10,
                              radius: const Radius.circular(10),
                              hintText: '••••',
                              textStyle: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // currentCode: _otpTextField.text,
                            controller: otpPinController,
                            codeLength: 4,
                            keyboardType: TextInputType.number,
                            // onCodeSubmitted: (code) {
                            //   _otpTextField.text = code;
                            // },
                            onCodeChanged: (code) async {
                              printThis(code);
                              if (code?.length == 4) {
                                FocusScope.of(context).unfocus();
                                var result = await loginSignUpProvider.verifyOTP(widget.email, code!);
                                printThis(result);
                                if(!mounted) return;
                                if (result == true) {
                                  Navigator.pop(context, result);
                                } else {
                                  Helper.showScaffold(context, "Some Error Occur.");
                                  // Navigator.pop(context,result);
                                  Navigator.pop(context, Future.error("Otp Not Verified."));
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer<LoginSignUpProvider>(builder: (context, loginSignUpProvider, child) {
                            return Material(
                              borderRadius: BorderRadius.circular(50),
                              color: ThemeColors.blueColor1,
                              child: InkWell(
                                splashColor: Colors.black12,
                                highlightColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                onTap: loginSignUpProvider.verifyingOTP
                                    ? null
                                    : () async {
                                        if (otpPinController.text.length == 4) {
                                          FocusScope.of(context).unfocus();
                                          var result =
                                              await loginSignUpProvider.verifyOTP(widget.email, otpPinController.text);
                                          printThis(result);
                                          if (result == true) {
                                            Navigator.pop(context, result);
                                          } else {
                                            Helper.showScaffold(context, "Some Error Occur.");
                                          }
                                        }
                                      },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: loginSignUpProvider.verifyingOTP
                                          ? const KSProgressAnimation(dotsColor: Colors.white)
                                          : Text(
                                              'Submit OTP',
                                              style: GoogleFonts.ubuntu(
                                                  letterSpacing: 1, color: Colors.white, fontWeight: FontWeight.w500),
                                            )),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
