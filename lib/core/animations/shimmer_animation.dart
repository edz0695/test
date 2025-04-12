import 'package:flutter/material.dart';
import '../components/shimmer_animation.dart';

class ShimmerAnimation extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  const ShimmerAnimation({super.key,this.height,this.width,this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius??10),
      child: SizedBox(
        height: height,width: width,
        child: KSShimmer
            .fromColors(
          baseColor: Colors.grey.shade400
              .withOpacity(0.2),
          highlightColor: Colors
              .black.withOpacity(.04),enabled: true,
          period: const Duration(milliseconds: 1000),
          direction: KSShimmerDirection.ltr,
          child: Container(
              height:
              double.infinity,
              width:
              double.infinity,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
