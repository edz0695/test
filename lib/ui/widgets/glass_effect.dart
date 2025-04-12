import 'dart:ui';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class GlassEffectedContainer extends StatelessWidget {
  const GlassEffectedContainer({
    super.key,
    this.child,
    this.height,
    this.colors,
  });

  final Widget? child;
  final double? height;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlassEffect(height: height),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 5),
          height: height ?? 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ThemeColors.lightGrey, width: 2),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: colors ?? caColors,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}

List<Color> caColors = [
  const Color(0xffA8B4DD).withOpacity(.7),
  const Color(0xff2057A6).withOpacity(.3),
  Colors.blue.withOpacity(.4),
];

class GlassEffect extends StatelessWidget {
  const GlassEffect({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 5),
          height: height ?? 160,
        ),
      ),
    );
  }
}

class GlassEffect2 extends StatelessWidget {
  const GlassEffect2({
    super.key,
    this.h,
    required this.child,
    this.w,
  });

  final double? h;
  final double? w;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: SizedBox(
          height: h ?? 160,
          width: w ?? double.infinity,
          child: child,
        ),
      ),
    );
  }
}
