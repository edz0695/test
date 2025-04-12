
import 'package:flutter/widgets.dart';

enum CvTabIndicatorSize {
  tiny,
  normal,
  full,
}

class CvTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final CvTabIndicatorSize indicatorSize;

  const CvTabIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.indicatorSize,
  });

  @override
  CvIndicatorPainter createBoxPainter([VoidCallback? onChanged]) {
    return CvIndicatorPainter(this, onChanged);
  }
}

class CvIndicatorPainter extends BoxPainter {
  final CvTabIndicator decoration;

  CvIndicatorPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == CvTabIndicatorSize.full) {
      rect = Offset(
        offset.dx,
        configuration.size!.height - decoration.indicatorHeight,
      ) &
      Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == CvTabIndicatorSize.tiny) {
      rect = Offset(
        offset.dx + configuration.size!.width / 2 - 8,
        configuration.size!.height - decoration.indicatorHeight,
      ) &
      Size(16, decoration.indicatorHeight);
    } else {
      rect = Offset(
        offset.dx + 6,
        configuration.size!.height - decoration.indicatorHeight,
      ) &
      Size(configuration.size!.width - 12, decoration.indicatorHeight);
    }

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
