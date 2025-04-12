import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EarnHomeSlideBanner extends StatefulWidget {
  const EarnHomeSlideBanner({
    super.key,
  });

  @override
  State<EarnHomeSlideBanner> createState() => _EarnHomeSlideBannerState();
}

class _EarnHomeSlideBannerState extends State<EarnHomeSlideBanner> {
  bool isLoading = true;
  List banners = [];

  @override
  void initState() {
    super.initState();
    _fetchBanners();
  }

  Future<void> _fetchBanners() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('loginToken');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/earn/banners');

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
          banners = decodedResponse["data"];
          isLoading = false; // Update loading state
        });
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false; // Update loading state even if request fails
        });
      }
    } catch (error) {
      print('Error calling API: $error');
      setState(() {
        isLoading = false; // Update loading state in case of error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(banners);
    return banners.isEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ShimmerAnimation(),
                  Text('Unknown error occured! Please Log in and try again'),
                ],
              ),
            ),
          )
        : CarouselSlider.builder(
            itemCount: isLoading ? 1 : banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              if (isLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return InkWell(
                  onTap: () {
                    // Handle banner tap
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        banners[itemIndex]["banner"],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const ShimmerAnimation();
                        },
                        errorBuilder: (context, error, stackTrace) => Stack(
                          alignment: Alignment.center,
                          children: [
                            ShimmerAnimation(),
                            Text('Internet Connection problem !'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
            options: CarouselOptions(
              height: 170,
              viewportFraction: 0.95,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
  }
}

//
// class EarnHomeSlideBanner extends StatefulWidget {
//   const EarnHomeSlideBanner({
//     super.key,
//   });
//
//   @override
//   State<EarnHomeSlideBanner> createState() => _EarnHomeSlideBannerState();
// }
//
// class _EarnHomeSlideBannerState extends State<EarnHomeSlideBanner> {
//   bool isLoading = true;
//   List banners = [];
//
//   @override
//   Widget build(BuildContext context) {
//     Future<void> _fetchBanners() async {
//       try {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         String? token = prefs.getString('token');
//         var apiUrl =
//             Uri.parse('https://xyzabc.sambhavapps.com/v1/earn/banners');
//
//         var response = await http.get(
//           apiUrl,
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         );
//
//         if (response.statusCode == 200) {
//           var decodedResponse = jsonDecode(response.body);
//           banners = decodedResponse["data"];
//         } else {
//           print('API Request Failed with Status Code: ${response.statusCode}');
//           setState(() {
//             isLoading = false;
//           });
//         }
//       } catch (error) {
//         print('Error calling API: $error');
//         setState(() {
//           isLoading = false;
//         });
//       }
//     }
//
//     _fetchBanners();
//     return CarouselSlider.builder(
//       itemCount: banners.length,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//           InkWell(
//         onTap: () {
//           // earnScreenProvider.getOfferDetails(
//           //     earnScreenProvider.earnMainModel!.banners[itemIndex].offerId);
//           // RouteConfig.navigateToLTR(
//           //     context,
//           //     OfferDetailsScreen(
//           //       title: 'Offer Details',
//           //       offerId: earnScreenProvider.offer!.id,
//           //     ));
//         },
//         child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white70, borderRadius: BorderRadius.circular(12)),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   banners[itemIndex]["banner"],
//                   height: double.infinity,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (BuildContext context, Widget child,
//                       ImageChunkEvent? loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return const ShimmerAnimation();
//                   },
//                   errorBuilder: (context, error, stackTrace) => const Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ShimmerAnimation(),
//                       Text('Internet lost!'),
//                     ],
//                   ),
//                 ))),
//       ),
//       options: CarouselOptions(
//         height: 170,
//         // aspectRatio: 16/9,
//         viewportFraction: 0.95,
//         // initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         // autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         // onPageChanged: callbackFunction,
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//     // return Consumer<EarnScreenProvider>(
//     //   builder: (_, earnScreenProvider, child) {
//     //     if (earnScreenProvider.earnMainModel != null) {
//     //       return ;
//     //     }
//     //     // return const ShimmerAnimation(
//     //     //   height: 200,
//     //     //   radius: 10,
//     //     // );
//     //   },
//     // );
//   }
// }
