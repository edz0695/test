import 'package:flutter/material.dart';
import 'package:payapp/core/components/app_decoration.dart';
import 'package:payapp/themes/colors.dart';


class ReviewsTab extends StatefulWidget {
  final List reviews;
  const ReviewsTab({super.key, required this.reviews});

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        // InkWell(
        //   borderRadius: BorderRadius.circular(10),
        //   onTap: () {
        //     RouteConfig.navigateToRTL(context, SendFeedBackScreen());
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       border:
        //           Border.all(width: 2, color: ThemeColors.backgroundLightBlue),
        //     ),
        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             const CircleAvatar(
        //               child: Icon(
        //                 Icons.person,
        //               ),
        //             ),
        //             const SizedBox(width: 15),
        //             Expanded(
        //               child: Container(
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 10, vertical: 12),
        //                 decoration: BoxDecoration(
        //                   border: Border.all(
        //                     width: 1,
        //                     color: Colors.grey[300]!,
        //                   ),
        //                   borderRadius: BorderRadius.circular(20),
        //                   color: Colors.white,
        //                 ),
        //                 child: const Text(
        //                   "Write your own Feedback!",
        //                   textAlign: TextAlign.start,
        //                   style: TextStyle(color: Colors.grey),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(height: 10),
        //         // const IgnorePointer(
        //         //   ignoring: true,
        //         //   child: AddImageToPost(ignoring: true),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.reviews.length,
          itemBuilder: (context, index) {
            return buildStack(index: index);
          },
        ),
      ],
    );
  }

  Stack buildStack({required int index}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: appBorderRadius,
            border: Border.all(
              width: 3,
              color: ThemeColors.darkBlueColor,
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.reviews[index]["user_name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              // const Text(
              //   'Flutter Developer',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 15.0,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.grey,
              //   ),
              // ),
              // const SizedBox(height: 10),
              Text(
                widget.reviews[index]["review_text"],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  widget.reviews[index]["star"],
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 5,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
            ),
            radius: 40,
          ),
        ),
      ],
    );
  }
}
