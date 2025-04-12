import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

back({Color color = Colors.indigo}) => IconButton(
      icon: Icon(
        Icons.arrow_left,
        color: color,
        size: 25,
      ),
      onPressed: () => Get.back(),
    );

toast(
    {String? title, required String message, Color? bgColor = Colors.indigo}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
