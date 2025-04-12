import 'package:flutter/material.dart';

import '../../core/components/shimmer_animation.dart';


class CarouselLoading extends StatelessWidget {
  const CarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return KSShimmer.fromColors(
      baseColor: Colors.grey.shade400
          .withOpacity(0.2),
      highlightColor: Colors
          .black.withOpacity(.04),
      enabled: true,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey.shade400
                ),
              ),
            ),
          ),
          SizedBox(
            width: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) =>  Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
