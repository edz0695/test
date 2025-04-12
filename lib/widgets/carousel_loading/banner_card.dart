import 'package:flutter/material.dart';
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';

import '../../core/components/shimmer_animation.dart';

class BannerCard extends StatelessWidget {
  const BannerCard(
      {super.key, required this.imageUrl, required this.withBaseUrl});

  final String imageUrl;
  final bool withBaseUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        withBaseUrl ? Constants.forImg + imageUrl : imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) =>
            KSShimmer.fromColors(
          baseColor: Colors.grey.shade400.withOpacity(0.2),
          highlightColor: Colors.black.withOpacity(.04),
          enabled: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
        errorBuilder: (context, url, error) => const Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            ShimmerAnimation(),
            Text('Error occurred!'),
          ],
        )),
      ),
    );
  }
}
