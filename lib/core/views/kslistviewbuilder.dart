import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class KSListView extends StatefulWidget {
  final Axis scrollDirection;
  final double? separateSpace;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final bool? shrinkWrap;
  final ScrollPhysics? scrollPhysics;
  final double? implementScrollBar;
  Widget Function(BuildContext buildContext, int index) itemBuilder;

  KSListView(
      {super.key,
      required this.scrollDirection,
      this.separateSpace,
      this.padding,
      required this.itemCount,
      required this.itemBuilder,
      this.shrinkWrap,
      this.implementScrollBar,
      this.scrollPhysics});

  @override
  State<KSListView> createState() => _KSListViewState();
}

class _KSListViewState extends State<KSListView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      radius: const Radius.circular(1000),
      thickness: widget.implementScrollBar ?? 5,
      thicknessWhileDragging: 10,
      child: ListView.separated(
          scrollDirection: widget.scrollDirection,
          shrinkWrap: widget.shrinkWrap ?? false,
          separatorBuilder: (context, index) => SizedBox(
                width: widget.separateSpace ?? 10,
                height: widget.separateSpace ?? 10,
              ),
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 10),
          itemCount: widget.itemCount,
          physics: widget.scrollPhysics ??
              const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: widget.itemBuilder),
    );
  }
}
