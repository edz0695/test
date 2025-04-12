import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/widgets/videoPost.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../models/settingsmodel.dart';
import '../../../../../../provider/setingsProvider.dart';

class EarnTestimonialVideos extends StatelessWidget {
  const EarnTestimonialVideos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
              Text(
                "   Testimonial  Videos   ",
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: Consumer<SettingsProvider>(
              builder: (context, settingsProvider, child) {
            if (settingsProvider.settingsModel!.testimonials.isNotEmpty) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TestimonialVideoItem(
                    testimonial:
                        settingsProvider.settingsModel!.testimonials[index],
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
                itemCount: settingsProvider.settingsModel!.testimonials.length,
              );
            } else {
              return const SizedBox(
                width: 80,
                height: 120,
                child: ShimmerAnimation(width: 80, height: 120),
              );
            }
          }),
        ),
      ],
    );
  }
}

class TestimonialVideoItem extends StatefulWidget {
  const TestimonialVideoItem({
    super.key,
    required this.testimonial,
  });

  final Testimonials testimonial;

  @override
  State<TestimonialVideoItem> createState() => _TestimonialVideoItemState();
}

class _TestimonialVideoItemState extends State<TestimonialVideoItem> {

  bool wannaPlayVideo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.all(5),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Builder(
            builder: (context) {
              if (widget.testimonial.video != '') {
                return Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: VideoPostOsama(videoLink: widget.testimonial.video),
                );
              }
              else{
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 10),
          Text(
            widget.testimonial.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ThemeColors.darkBlueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
