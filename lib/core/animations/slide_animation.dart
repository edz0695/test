import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final double? fromLeft;
  final double? fromRight;
  final double? fromTop;
  final double? fromBottom;
  final Widget child;

  const SlideAnimation(
      {super.key,
      this.fromLeft,
      this.fromRight,
      required this.child,
      this.fromTop,
      this.fromBottom,
      });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _transform;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _transform = Tween<Offset>(
            begin: Offset(widget.fromRight ?? -((widget.fromLeft) ?? 0), 0),
            end: const Offset(0, 0))
        .animate(_controller)
      ..addListener(() {});
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _transform, child: widget.child);
  }
}

class SlideAnimation2 extends StatefulWidget {
  final double? fromLeft;
  final double? fromRight;
  final double? fromTop;
  final double? fromBottom;
  final Widget child;

  const SlideAnimation2({
    super.key,
    this.fromLeft,
    this.fromRight,
    this.fromTop,
    this.fromBottom,
    required this.child,
  });

  @override
  State<SlideAnimation2> createState() => _SlideAnimation2State();
}

class _SlideAnimation2State extends State<SlideAnimation2>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _transform;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    Offset begin;
    Offset end;

    if (widget.fromLeft != null) {
      begin = Offset(widget.fromLeft!, 0);
      end = const Offset(0, 0);
    } else if (widget.fromRight != null) {
      begin = Offset(widget.fromRight! * -1, 0);
      end = const Offset(0, 0);
    } else if (widget.fromTop != null) {
      begin = Offset(0, widget.fromTop! * -1);
      end = const Offset(0, 0);
    } else if (widget.fromBottom != null) {
      begin = Offset(0, widget.fromBottom!);
      end = const Offset(0, 0);
    } else {
      throw ArgumentError(
        'At least one of fromLeft, fromRight, fromTop, or fromBottom must be provided.',
      );
    }

    _transform = Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(_controller)
      ..addListener(() {});

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _transform, child: widget.child);
  }
}
