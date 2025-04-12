import 'package:flutter/material.dart';

class RouteConfig {
  static Route _createRouteRTL({required Widget widget}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route _createRouteLTR({required Widget widget}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static void navigateTo(context, widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static void navigateToRTL(context, widget) {
    Navigator.of(context).push(_createRouteRTL(widget: widget));
  }

  static void navigateToLTR(context, widget) {
    Navigator.of(context).push(_createRouteLTR(widget: widget));
  }

  static Future navigate2(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) => false,
      );

  static void navigateToAndRemoveAllLTR(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      _createRouteLTR(widget: widget),
      (Route<dynamic> route) => false,
    );
  }

  static void navigateToAndRemoveAllRTL(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      _createRouteRTL(widget: widget),
      (Route<dynamic> route) => false,
    );
  }
}
