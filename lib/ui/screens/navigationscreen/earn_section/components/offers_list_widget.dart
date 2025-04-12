import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/config/route_config.dart';
import 'package:payapp/core/components/app_decoration.dart';
import 'package:payapp/ui/widgets/glass_effect.dart';
import 'package:provider/provider.dart';
import '../../../../../models/earnoffermodel.dart';
import '../../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../../../../themes/colors.dart';
import '../sub_screens/offers_details_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:http/http.dart' as http;

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
    required this.offer,
  });

  final List<EarnOfferModel> offer;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: offer.length,
      itemBuilder: (context, index) {
        return offerTab(context, index, offer[index]);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
        height: 10,
      ),
    );
  }
}

Widget offerTab(BuildContext context, int index, EarnOfferModel offer) {
  Future<File> downloadAndSaveImage(String url, String filename) async {
    var response = await http.get(Uri.parse(url));
    var documentDirectory = await getApplicationDocumentsDirectory();
    File file = File('${documentDirectory.path}/$filename');
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  void shareOfferWithImage(EarnOfferModel offer) async {
    File imageFile =
        await downloadAndSaveImage(offer.logoImage, 'offerImage.png');

    String textToShare = """
    Check out this great deal!
    Title: ${offer.title}
    Highlight: ${offer.highlight}
    Offer Price: ${offer.offerPrice}
    Old Price: ${offer.oldPrice}
    More details: ${offer.shareLink}
  """;
    Share.shareXFiles([XFile(imageFile.path)], text: textToShare);

    // Share.shareFiles([imageFile.path], text: textToShare);
  }

  return SizedBox(
    height: 230,
    child: Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            final earnScreenProvider =
                Provider.of<EarnScreenProvider>(context, listen: false);
            earnScreenProvider.getOfferDetails(offer.id);

            RouteConfig.navigateToRTL(
              context,
              OfferDetailsScreen(
                title: offer.title,
                offerId: offer.id,
              ),
            );
          },
          child: GlassEffectedContainer(
            height: 180,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              offer.title,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: ThemeColors.darkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              child: HtmlWidget(
                                offer.highlight,
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Image.network(
                              offer.logoImage,
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          shareOfferWithImage(offer);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColors.darkBlueColor,
                          ),
                          child: const Icon(
                            Icons.share_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColors.darkBlueColor,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Text(
                          "₹${offer.oldPrice}",
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ThemeColors.darkBlueColor,
                        ),
                        child: Text(
                          "₹${offer.offerPrice}",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          widthFactor: 3.6,
          heightFactor: 6.85,
          child: Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: appBorderRadius,
              color: const Color(0xff020C2F),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 13,
                ),
                Text(
                  'Active',
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
