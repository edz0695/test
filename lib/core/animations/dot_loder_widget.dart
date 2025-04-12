import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The individual item to animate.
class Actor extends StatelessWidget {
  final double size;
  final Color? dotsColor;

  const Actor({super.key, this.size = 9.0,this.dotsColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size / 2, //if rectangle
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // shape: BoxShape.rectangle,
        color: dotsColor,
      ),
    );
  }
}

/// The main animation widget.
class KSProgressAnimation extends StatefulWidget {
  final Color dotsColor;
  final int? numberOfDots;
  final Duration? duration;
  const KSProgressAnimation({super.key, required this.dotsColor,this.numberOfDots,this.duration});
  @override
  KSProgressAnimationState createState() => KSProgressAnimationState();
}

class KSProgressAnimationState extends State<KSProgressAnimation>
    with SingleTickerProviderStateMixin {
  final double initialOffset = 0.0;
  final double finalOffset = 0.7;
  late AnimationController _loadingAnimationController;

  @override
  void initState() {
    super.initState();
    _initLoadingAnimationController();
    _loadingAnimationController.forward();
  }

  @override
  void dispose() {
    _loadingAnimationController.dispose();
    super.dispose();
  }

  // method to be called when the widget mounts
  void _initLoadingAnimationController() {
    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration??const Duration(milliseconds: 1500),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _loadingAnimationController.forward(from: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 80, // if rectangle
      width: 50,
      height: 10,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.numberOfDots??4, _generateActors),
          ),
          // _loadingText(),
        ],
      ),
    );
  }

  // Widget _loadingText() {
  //   Animation animation = _textAnimation();
  //   return AnimatedBuilder(
  //     // You should create a separate animation
  //     animation: animation,
  //     builder: (BuildContext context, Widget? child) {
  //       return Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: Opacity(
  //           opacity: animation.value,
  //           child: Text(
  //             'LOADING',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _generateActors(int index) {
    Animation animation = _initLoadingAnimation(index);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // We can have multiple variations of animations with
        // this technique
        // return Transform.translate(
        //   offset: Offset(0, double.parse((-10 * animation.value).toString())),
        //   child: child,
        // );
        return Transform.rotate(
          angle: animation.value * math.pi / 2,
          origin: const Offset(0,0),
          alignment: Alignment.topRight,
          filterQuality: FilterQuality.high,
          child: child,
        );
        // return Transform.scale(
        //   scale: animation.value,
        //   child: child,
        // );
        // return Opacity(
        //   opacity: animation.value,
        //   child: child,
        // );
      },
      child: Actor(dotsColor:widget.dotsColor),
    );
  }

  Animation<double> _initLoadingAnimation(int index) {
    double lastActorStartTime = 0.3;
    double actorAnimationDuration = 0.6;
    double begin = lastActorStartTime * (index / (widget.numberOfDots ?? 4));
    double end = actorAnimationDuration + begin;
    // Using Tween doesnt give us the desired output so we create a
    // custom Animatable
    // return Tween(begin: initialOffset, end: finalOffset)
    return Sinusoid(min: initialOffset, max: finalOffset).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Interval(begin, end, curve: Curves.ease),
      ),
    );
  }

  Animation<double> _textAnimation() {
    return Sinusoid(min: initialOffset, max: finalOffset).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn),
      ),
    );
  }
}

/// Tween moves from begin to end linearly
/// We don't want this because the animation stays at its max value at the end
/// then jumps back to the begin at the start of the next cycle.
/// So we create our custom animation to move in a wavy like form using sine
/// It is at its max value at the middle of the animation
/// and it at its min value at the begin and end,
/// thus giving us a wavy effect.
class Sinusoid extends Animatable<double> {
  final double min;
  final double max;

  Sinusoid({required this.min, required this.max});

  /// Here, the transform method takes the `t` and multiply it by `math.pi`
  /// then find its `sine`.
  /// The sine of `pi` is 0. The sine of `pi/2` is 1.
  /// This means that when the animation is at 0.5 the result of the
  /// sine function would be 1 hence giving us the max at the middle of the animation
  @override
  double transform(double t) {
    return min + (max - min) * math.sin(math.pi * t);
  }
}