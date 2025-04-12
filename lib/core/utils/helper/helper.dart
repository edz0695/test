import 'package:flutter/material.dart';

class Helper {
  static showScaffold(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        content: Text(message),
      ),
    );
  }
}

showScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      content: Text(message),
    ),
  );
}

SizedBox height(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox width(double width) {
  return SizedBox(
    width: width,
  );
}
