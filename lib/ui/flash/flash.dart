import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payapp/themes/colors.dart';

import '../../data/model/body/notification_body.dart';
import '../../models/usermodel.dart';
import '../../view/screens/auth/sign_in_screen.dart';
import '../screens/navigationscreen/navigation_screen.dart';
import '../screens/onboardingscreen/onboardingscreen.dart';

class FlashScreen extends StatefulWidget {
  final UserModel? userModel;
  final bool skip;
  final bool onBoardingStatus;

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const FlashScreen(
      {super.key,
      required this.userModel,
      required this.skip,
      required this.onBoardingStatus,
      required this.languages,
      required this.body});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: widget.userModel != null || widget.skip
                ? NavBar(
                    fromSplash: false,
                    languages: widget.languages,
                    body: widget.body,
                    pageIndex: 0,
                  )
                : widget.onBoardingStatus
                    ? const SignInScreen(exitFromApp: true, backFromThis: true)
                    : OnBoardingScreen(
                        languages: widget.languages,
                        body: widget.body,
                      ),
            page: widget.userModel != null || widget.skip
                ? NavBar(
                    languages: widget.languages,
                    body: widget.body,
                    fromSplash: false,
                    pageIndex: 0,
                  )
                : widget.onBoardingStatus
                    ? const SignInScreen(exitFromApp: true, backFromThis: true)
                    : OnBoardingScreen(
                        languages: widget.languages,
                        body: widget.body,
                      ),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.primaryBlueColor,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 100
                      : 100,
              width: _d
                  ? w
                  : _c
                      ? 100
                      : 100,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(100)),
              child: Center(
                child: _e ? Image.asset("assets/logo.png") : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        centerTitle: true,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
