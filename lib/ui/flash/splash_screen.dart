import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/themes/colors.dart';
import '../../controller/cart_controller.dart';
import '../../controller/splash_controller.dart';
import '../../data/model/body/notification_body.dart';
import '../../models/usermodel.dart';
import '../../view/screens/auth/sign_in_screen.dart';
import '../screens/navigationscreen/navigation_screen.dart';
import '../screens/onboardingscreen/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {super.key,
      required this.userModel,
      required this.skip,
      required this.onBoardingStatus,
      required this.languages,
      required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;
  final UserModel? userModel;
  final bool skip;
  final bool onBoardingStatus;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  void goTo() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        controller.dispose();
        animation.removeStatusListener((status) {});
        print("user model is>>>>>>>>>>>>>>>>>>>>>");
        print(widget.userModel);
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: (widget.userModel != null || widget.skip)
                ? NavBar(
                    languages: widget.languages,
                    body: widget.body,
                    fromSplash: true,
                    pageIndex: 0,
                  )
                // EducationFormScreen()
                : (widget.onBoardingStatus)
                    ? const SignInScreen(exitFromApp: false, backFromThis: true)
                    : OnBoardingScreen(
                        languages: widget.languages,
                        body: widget.body,
                      ),
            page: (widget.userModel != null || widget.skip)
                ? NavBar(
                    languages: widget.languages,
                    body: widget.body,
                    fromSplash: true,
                    pageIndex: 0,
                  )
                // EducationFormScreen()
                : (widget.onBoardingStatus)
                    ? const SignInScreen(exitFromApp: false, backFromThis: true)
                    : OnBoardingScreen(
                        languages: widget.languages,
                        body: widget.body,
                      ),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.85,
      upperBound: 1,
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    goTo();

    Get.find<SplashController>().initSharedData();
    Get.find<CartController>().getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                ),
              ),
            ),
            const Text(
              'SAMBHAV',
              style: TextStyle(
                color: ThemeColors.primaryBlueColor,
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
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
