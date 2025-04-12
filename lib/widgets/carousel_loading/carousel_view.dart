import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'banner_card.dart';

// ignore: must_be_immutable
class CarouselView extends StatefulWidget {
  CarouselView(
      {super.key,
      required this.bannerList,
      required this.onTap,
      required this.withBaseUrl});

  final bool withBaseUrl;

  final List<dynamic> bannerList;
  final VoidCallback onTap;
  int currentIndex = 0;

  int get index => currentIndex;

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.bannerList.length,
            itemBuilder: (context, index, realIndex) => InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(10),
              child: BannerCard(
                imageUrl: widget.bannerList[index],
                withBaseUrl: widget.withBaseUrl,
              ),
            ),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  widget.currentIndex = index;
                });
              },
              height: 180,
              viewportFraction: .95,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
