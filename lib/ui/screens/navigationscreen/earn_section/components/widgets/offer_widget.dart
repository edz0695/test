import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/models/earnoffermodel.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../config/apiconfig.dart';
import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../core/utils/helper/helper.dart';
import '../../../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../sub_screens/offers_details_screen.dart';

class EarnNewOfferWidget extends StatelessWidget {
  final EarnOfferModel earnOfferModel;

  const EarnNewOfferWidget({super.key, required this.earnOfferModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            color: const Color(0xff2057A6).withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.transparent,
          onTap: () {
            final earnScreenProvider =
                Provider.of<EarnScreenProvider>(context, listen: false);
            earnScreenProvider.getOfferDetails(earnOfferModel.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfferDetailsScreen(
                  title: earnOfferModel.title,
                  offerId: earnOfferModel.id,
                ),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    Constants.forImg + earnOfferModel.logoImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Stack(
                      alignment: Alignment.center,
                      children: [
                        ShimmerAnimation(),
                        Text('Internet lost!'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        earnOfferModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(fontSize: 12),
                        maxLines: 1,
                      ),
                      Text(
                        earnOfferModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: Colors.grey),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                          child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final userDataProvider =
                                Provider.of<LoginSignUpProvider>(context,
                                    listen: false);

                            if (userDataProvider.userModel != null &&
                                !userDataProvider.loading) {
                              var url =
                                  "${earnOfferModel.shareLink}?w1=${userDataProvider.userModel!.email}";
                              Uri encoded = Uri.parse(url);

                              await launchUrl(encoded,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              Helper.showScaffold(context, "Login Required.");
                            }
                          },
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                          child: const Center(
                            child: Image(
                              image: AssetImage('assets/icons/browser.png'),
                              color: Colors.blue,
                              height: 20,
                            ),
                          ),
                        ),
                      )),
                      const VerticalDivider(
                        thickness: 1,
                        width: 0,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            final userDataProvider =
                                Provider.of<LoginSignUpProvider>(context,
                                    listen: false);
                            if (userDataProvider.userModel != null &&
                                !userDataProvider.loading) {
                              Share.share(
                                  "${Constants.shareMessage}\n${earnOfferModel.shareLink}?w1=${userDataProvider.userModel!.email}",
                                  subject: 'DivTag Apps Link');
                            } else {
                              Helper.showScaffold(context, "Login Required.");
                            }
                          },
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                          child: const Center(
                            child: Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
