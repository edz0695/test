import 'package:flutter/material.dart';

BoxDecoration appBoxDecoration({
  Color? color,
  BoxBorder? border,
  List<BoxShadow>? shadow,
  BorderRadiusGeometry? borderRadius,
 DecorationImage? image,
}) =>
    BoxDecoration(
      color: color ?? Colors.white,
      border: border ?? appBorder,
      borderRadius: borderRadius ?? appBorderRadius,
      boxShadow: shadow ?? appShadow,
      image: image,

    );

BorderRadius? appBorderRadius = BorderRadius.circular(20);

List<BoxShadow>? appShadow = [
  BoxShadow(
    offset: const Offset(0, 0),
    color: const Color(0xff2057A6).withOpacity(0.7),
    spreadRadius: .05,
    blurRadius: 5.0,
  ),
];

BoxBorder? appBorder = Border.all(
  color: Colors.black,
  width: 2,
);
