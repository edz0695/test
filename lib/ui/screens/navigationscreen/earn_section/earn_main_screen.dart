import 'package:flutter/material.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/view/screens/referral_screens/referral_main.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helper/helper.dart';
import '../../../../provider/earn_providers/earn_screen_provider.dart';
import '../../../../provider/walletProvider.dart';
import 'components/for_home_screen/earn_categories_consumer.dart';
import 'components/for_home_screen/earn_new_offers_slide_banner.dart';
import 'components/for_home_screen/start_earning_header_banner.dart';

class EarnMainScreen extends StatefulWidget {
  const EarnMainScreen({super.key});

  @override
  State<EarnMainScreen> createState() => _EarnMainScreenState();
}

class _EarnMainScreenState extends State<EarnMainScreen>
    with AutomaticKeepAliveClientMixin<EarnMainScreen> {
  @override
  void initState() {
    super.initState();
    final userProvider =
        Provider.of<LoginSignUpProvider>(context, listen: false);
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    if (userProvider.userModel != null) {
      walletProvider.getWalletDetails(userId: userProvider.userModel!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        onRefresh: () {
          final provider =
              Provider.of<EarnScreenProvider>(context, listen: false);

          provider.getActiveOffersforAllCata();
          return provider.getActiveCategories();
        },
        color: ThemeColors.primaryBlueColor,
        child: Scaffold(
          appBar: AppBar(),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            key: const PageStorageKey<String>("EARN_SCREEN"),
            children: [
              const FlipBalanceCard(),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 60, height: 1, color: const Color(0xffD0CFCE)),
                      const SizedBox(width: 10),
                      const Text(
                        "Sell and Earn",
                        style: TextStyle(
                          fontSize: 13,
                          color: ThemeColors.darkBlueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          width: 60, height: 1, color: const Color(0xffD0CFCE)),
                    ],
                  ),
                ),
              ),

              height(15),

              const EarnCategoriesConsumer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50, height: 1, color: const Color(0xffD0CFCE)),
                  const SizedBox(width: 10),
                  const Text(
                    "Refer and Earn",
                    style: TextStyle(
                      fontSize: 13,
                      color: ThemeColors.darkBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      width: 50, height: 1, color: const Color(0xffD0CFCE)),
                ],
              ),
              height(15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReferralMain(),
                  ));
                },
                child: Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refer a Friend &\nearn rewards",
                              style: TextStyle(
                                fontSize: 12,
                                color: ThemeColors.blueColor1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/refer.jpg",
                          height: 150,
                          width: 180,
                        )
                      ],
                    )),
              ),
              const EarnNewOffersSlideBannerConsumer(),
              // const EarnSambhavShorts(),
              height(100)
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
