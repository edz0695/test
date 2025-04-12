import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/animations/dot_loder_widget.dart';
import '../../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../../../../themes/colors.dart';
import '../../../../../widgets/youtube_video_player.dart';
import '../../faqScreen/faqItem.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnScreenProvider>(
        builder: (context, earnScreenProvider, child) {
      return RefreshIndicator(
        onRefresh: () {
          return earnScreenProvider
              .getOfferDetails(earnScreenProvider.offer!.id);
        },
        color: ThemeColors.primaryBlueColor,
        child: earnScreenProvider.offer == null
            ? const Center(
                child: KSProgressAnimation(
                  dotsColor: ThemeColors.primaryBlueColor,
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            color: const Color(0xff2057A6).withOpacity(0.2),
                            blurRadius: 20.0,
                          ),
                        ],
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.3), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Benefits :',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1. ${earnScreenProvider.offer!.benefits}',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.25),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            color: const Color(0xff2057A6).withOpacity(0.2),
                            blurRadius: 20.0,
                          ),
                        ],
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.3), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'How it work',
                          style: TextStyle(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1. ${earnScreenProvider.offer!.howItWorks}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.25),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            color: const Color(0xff2057A6).withOpacity(0.2),
                            blurRadius: 20.0,
                          ),
                        ],
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.3), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Faq",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            );
                          }

                          return FaqListItem(
                            defaultColor: Colors.blue.shade50,
                            question: earnScreenProvider
                                .offer!.faqList[index].question,
                            answer:
                            earnScreenProvider.offer!.faqList[index].answer,
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: earnScreenProvider.offer!.faqList.length),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            color: const Color(0xff2057A6).withOpacity(0.2),
                            blurRadius: 20.0,
                          ),
                        ],
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.3), width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Terms & Conditions',
                          style: TextStyle(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          earnScreenProvider.offer!.terms,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 165,
                  ),
                ],
              ),
      );
    });
  }
}
