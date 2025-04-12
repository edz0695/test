import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/models/earnoffermodel.dart';
import 'package:payapp/provider/earn_providers/earn_screen_provider.dart';
import 'package:payapp/ui/screens/navigationscreen/earn_section/components/banks_list_widget.dart';
import 'package:payapp/ui/screens/navigationscreen/earn_section/components/offers_list_widget.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/components/print_text.dart';
import '../../../../dialogs/loaderdialog.dart';

class AllOffersScreen extends StatefulWidget {
  final String categoryId;
  bool Allcata;

  AllOffersScreen({super.key, required this.categoryId, this.Allcata = false});

  @override
  State<AllOffersScreen> createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {
  List<EarnOfferModel> offers = [];
  bool isLoading = true; // Add isLoading variable

  @override
  void initState() {
    super.initState();
    _fetchOffers();
  }

  Future<void> _fetchOffers() async {
    setState(() {
      isLoading = true; // Set isLoading to true when fetching starts
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl = Uri.parse(
          'https://xyzabc.sambhavapps.com/v1/earn/offer/cat/${widget.categoryId}');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        setState(() {
          print("Printing available offers");
          print(decodedResponse["data"]);
          offers = (decodedResponse["data"] as List)
              .map((offerData) => EarnOfferModel(
                    id: offerData["id"],
                    title: offerData["title"],
                    highlight: offerData["highlight"],
                    offerPrice: offerData["offer_price"],
                    oldPrice: offerData["old_price"],
                    logoImage: offerData["logo"],
                    shareLink: offerData["share_link"],
                  ))
              .toList();
          isLoading = false; // Set isLoading to false after fetching completes
        });
      } else {
        printThis(
            'API Request Failed with Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false; // Set isLoading to false if request fails
        });
      }
    } catch (error) {
      printThis('Error calling API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnScreenProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget(title: "Sell & Earn".toUpperCase(), size: 30),
          body: SafeArea(
            child: isLoading
                ? loading()
                : offers.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie/not_found.json',
                              width: MediaQuery.of(context).size.width / 1.3,
                            ),
                            const Text(
                              "No Offers Available.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          const BanksListView(),
                          Expanded(
                            child: OffersListView(offer: offers),
                          ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}

// final provider = Provider.of<EarnScreenProvider>(context, listen: false);
// provider.getActiveOffers(id: id);
// provider.getActiveOffersfor_all_cata();
// if (provider.offers != null && AllCata == false) {
//   final newOffers = provider.offers!.newOffers
//       .where((element) => element.categoryId == widget.categoryId)
//       .toList();
//   final oldOffers = provider.offers!.oldOffers
//       .where((element) => element.categoryId == widget.categoryId)
//       .toList();
//   offer.addAll(newOffers);
//   offer.addAll(oldOffers);
//   print(offer.length);
// }
// if (AllCata == true) {
//   final AllnewOffers = provider.offersForAll!.newOffers
//       .where((element) => element.categoryId != "-22")
//       .toList();
//   final AlloldOffers = provider.offersForAll!.oldOffers
//       .where((element) => element.categoryId != "-22")
//       .toList();
//   offer.addAll(AllnewOffers);
//   offer.addAll(AlloldOffers);
//   print(offer.length);
// }
