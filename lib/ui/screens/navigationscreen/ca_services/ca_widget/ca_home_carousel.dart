import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/apiconfig.dart';
import '../../../../../core/animations/shimmer_animation.dart';
import '../../../../../provider/caservicesprovider/ca_services_provider.dart';

class CAHomeCarousel extends StatelessWidget {
  const CAHomeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CaServicesProvider>(
      builder: (context, caServiceProvider, child) {
        return Container(
          height: 170,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: caServiceProvider.isLoading
              ? const ShimmerAnimation()
              : CarouselSlider.builder(
                  itemCount: caServiceProvider.services.bannerImage.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    // height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        Constants.forImg +
                            caServiceProvider.services.bannerImage[itemIndex],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return const ShimmerAnimation();
                        },
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const ShimmerAnimation();
                        },
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 170,
                    // aspectRatio: 16/9,
                    viewportFraction: 0.95,
                    // initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    // autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
        );
      },
    );
  }
}
