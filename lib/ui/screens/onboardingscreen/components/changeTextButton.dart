import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/body/notification_body.dart';
import '../../../../provider/loginSignUpProvider.dart';
import '../../../../themes/colors.dart';
import '../../../../view/screens/auth/sign_in_screen.dart';
import '../../loginscreen/loginscreen.dart';

class ChangeTextButton extends StatefulWidget {
  final PageController pageController;
  final int length;
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const ChangeTextButton(
      {super.key,
      required this.pageController,
      required this.length,
      required this.languages,
      required this.body});

  @override
  State<ChangeTextButton> createState() => _ChangeTextButtonState();
}

class _ChangeTextButtonState extends State<ChangeTextButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.pageController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ThemeColors.primaryBlueColor.withOpacity(0.2),
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        onTap: () async {
          if (widget.pageController.page != null &&
              widget.pageController.page! >= ((widget.length) / 2)) {
            final loginSignUpProvider =
                Provider.of<LoginSignUpProvider>(context, listen: false);
            await loginSignUpProvider.doneOnBoarding().then(
              (value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          SignInScreen(exitFromApp: true, backFromThis: true)),
                  (route) => false,
                );
              },
            );
          } else {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: widget.pageController.page != null &&
                    widget.pageController.page! >= ((widget.length) / 2)
                ? const Text(
                    "DONE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryBlueColor),
                  )
                : const Text(
                    "NEXT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryBlueColor),
                  ),
          ),
        ),
      ),
    );
  }
}
