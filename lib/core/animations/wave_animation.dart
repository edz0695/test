import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../themes/colors.dart';

class WaterEffect extends StatefulWidget {
  const WaterEffect({super.key});

  @override
  _WaterEffectState createState() => _WaterEffectState();
}

class _WaterEffectState extends State<WaterEffect>
    with TickerProviderStateMixin {
  ValueNotifier<double> sliderData = ValueNotifier<double>(0.2);
  final WaterEffectPainter _waterEffectPainter = WaterEffectPainter();

  late AnimationController _animationController;
  late Animation _animation;

  // lets make tween for animation ticker

  @override
  void initState() {
    super.initState();
    // lets Start!

    // this duration u can set anything..
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_animationController)
      ..addListener(() =>
          _waterEffectPainter.setAnimationValue(_animationController.value));

    _waterEffectPainter.setSliderHeight(sliderData.value);
    _waterEffectPainter.setAnimationValue(_animationController.value);
    // my mistake.. need run animator controller 1st. haha
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          alignment: Alignment.bottomCenter,
          color: ThemeColors.backgroundLightBlue,
          child: CustomPaint(
            // lets make custom painter
            // ops..let make responsive painter
            foregroundPainter: _waterEffectPainter,
            child: Container(
                // color: Colors.yellow,
                height: 0),
          ),
        );
      },
    );
  }
}

class WaterEffectPainter extends CustomPainter with ChangeNotifier {
  double animationValue = 0;
  double sliderValue = 5;
  double degree2Radian = math.pi / 180.0;

  WaterEffectPainter();

  @override
  void paint(Canvas canvas, Size size) {
    List<Map<String, dynamic>> waves = <Map<String, dynamic>>[];

    // increment ,front on top
    waves.addAll([
      {
        'speed': 2.0,
        'paint': Paint()
          ..color = ThemeColors.backgroundLightBlue
          ..style = PaintingStyle.fill,
        'stroke': Paint()
          ..color = ThemeColors.backgroundLightBlue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0,
        'offsetX': 0.0, // make ocean offset x axis later,
        'bend': 3.0 // make each ocean bend different
      },
    ]);

    buildWaves(canvas, size, waves: waves, offsetY: 30.0);

    // yeay.. lastly, make reverse for ocean
  }

  void buildWaves(Canvas canvas, Size size,
      {required List<Map<String, dynamic>> waves, offsetY = 20.0}) {
    double offsetYValue = -(offsetY * waves.length);

    waves.reversed.toList().asMap().entries.forEach((row) {
      Path pathWave = Path();
      Paint paint = row.value['paint'];
      Paint paintStroke = row.value['stroke'];
      double bend = row.value['bend'] ?? 7.0;
      double speed = row.value['speed'] ?? 5.0;
      bool reverse = row.value['reverse'] ?? false;

      offsetYValue += row.key != 0 ? offsetY : 0;

      // make stroke

      // how to make multiple ocean?
      // lets duplicate

      // let generate function generate wave sin so we can use for later
      pathWave.extendWithPath(
          generateSinWave(size,
              totalPoint: 3,
              bendRadius: bend,
              speedWave: speed,
              reverse: reverse),
          Offset(0, offsetYValue)); // make ocean shadow more top
      canvas.drawPath(pathWave, paintStroke);

      pathWave.lineTo(size.width, size.height);
      pathWave.lineTo(0, size.height);

      canvas.drawPath(pathWave, paint);
    });

    // can see stroke on right ocean..not good..
  }

  Path generateSinWave(size,
      {required double bendRadius,
      required double totalPoint,
      double speedWave = 1,
      required bool reverse}) {
    // generate list sin wave offset point
    List<Offset> sinWaves = <Offset>[];
    for (int i = 0; i <= size.width; i++) {
      sinWaves.add(Offset(
          i.toDouble(),
          sin((speedWave *
                          (reverse ? 1 - animationValue : animationValue) *
                          360 -
                      i * totalPoint) %
                  360 *
                  degree2Radian) *
              bendRadius));
    }

    Path path = Path();
    path.addPolygon(sinWaves.toList(), false);
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // later can customize
    return true;
  }

  setAnimationValue(double value) {
    animationValue = value;
    notifyListeners();
    // we use change notifier in painter
  }

  void setSliderHeight(double value) {
    sliderValue = value;
    notifyListeners();
  }
}
