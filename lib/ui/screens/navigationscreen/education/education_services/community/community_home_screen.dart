import 'package:get/get.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/community/screens/new_post_screen.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../../../src/src.dart';
import '../../../../../../themes/icons_broken.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CommunityHomeScreen extends StatefulWidget {
  const CommunityHomeScreen({super.key});

  @override
  State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  List items = [];

  Future<void> fetchData() async {
    var apiUrl =
        Uri.parse('https://xyzabc.sambhavapps.com/v1/education/community/post');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('auth-token') ?? '';
    var response = await http.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        items = jsonData["data"];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    final communityProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    // communityProvider.getCoGroups();
    // communityProvider.getCoPosts();
    // communityProvider.isLoadingCategorised = true;
    fetchData();
  }

  int currentIndex = 0;

  final CommunityController community = Get.find<CommunityController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Community Feeds',
        size: 55,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                RouteConfig.navigateToRTL(context, NewPostScreen());
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "What's in your mind?",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // const IgnorePointer(
                    //   ignoring: true,
                    //   child: AddImageToPost(ignoring: true),
                    // ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildSingleItem(
                    uId: items[index]["user"]["id"],
                    index: index,
                    media: items[index]["media"] ?? [],
                    size: size,
                    title: items[index]["title"] ?? "",
                    comments: items[index]["comments"] ?? "",
                    likes: items[index]["like"] ?? "",
                    shares: items[index]["share"] ?? "",
                    logo: items[index]["user"]["logo"] ?? "",
                    username: items[index]["user"]["name"] ?? "");
              },
            ),
          ],
        ),
      ),
    );
  }

  Card buildSingleItem(
      {required Size size,
      required int index,
      required String username,
      required String title,
      required String? logo,
      required String likes,
      required String shares,
      required List media,
      required String uId,
      required List comments}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff184070),
                ),
              ),
              height(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: false,
                            aspectRatio: 2,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          items: media.map((url) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height(10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeColors.white,
                ),
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () => community.addLikesAPI({}, uId),
                      child: const Icon(
                        IconBroken.Heart,
                        color: ThemeColors.darkBlueColor,
                        size: 28,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () => _showCommentDialog(
                          uId: uId, userName: userName, logo: logo!),
                      child: const Icon(
                        IconBroken.Chat,
                        color: ThemeColors.darkBlueColor,
                        size: 28,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () {},
                      child: const Icon(
                        IconBroken.Send,
                        color: ThemeColors.darkBlueColor,
                        size: 28,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () {},
                      child: const Icon(
                        Icons.more,
                        color: ThemeColors.darkBlueColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     title,
              //     style: TextStyle(
              //       fontWeight: FontWeight.w600,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCommentDialog(
      {required String uId, required String userName, required String logo}) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.all(5),
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: Column(
            children: [
              Text(
                "Comments",
                style: TextStyle(
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              height(20),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Add comment here...",
                    hintStyle: TextStyle(
                        fontSize: Dimensions.fontSizeSmall, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.indigo,
                      ),
                      onPressed: () => controller.text.isEmpty
                          ? toast(message: "Empty comment can't send")
                          : community.addCommentsAPI({
                              "user_id": uId,
                              "user_logo": logo,
                              "user_name": userName,
                              "comment_text": controller.text,
                            }, uId),
                    )),
              ),
            ],
          ),
          // content: SizedBox(
          //   height: 300,
          //   width: 400,
          //   child: Stack(
          //     children: [
          //       SingleChildScrollView(
          //         physics: BouncingScrollPhysics(),
          //         child: widget.comments == null
          //             ? Center(
          //                 child: Padding(
          //                   padding: EdgeInsets.only(top: 150),
          //                   child: Text(
          //                     "Comments not found!",
          //                     style: TextStyle(
          //                         fontSize: Dimensions.fontSizeSmall,
          //                         color: Colors.grey),
          //                   ),
          //                 ),
          //               )
          //             : Column(
          //                 children: List.generate(
          //                 widget.comments!.length,
          //                 (index) {
          //                   var comment = widget.comments![index];
          //                   return ListTile(
          //                     leading: CircleAvatar(),
          //                     title: Text(
          //                       comment.postedBy!,
          //                       style: TextStyle(
          //                           fontSize: Dimensions.fontSizeSmall,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     subtitle: Text(
          //                       comment.comment!,
          //                       style: TextStyle(
          //                           fontSize: Dimensions.fontSizeExtraSmall,
          //                           color: Colors.grey,
          //                           fontWeight: FontWeight.w600),
          //                     ),
          //                   );
          //                 },
          //               )),
          //       ),
          //     ],
          //   ),
          // ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:payapp/config/route_config.dart';
// import 'package:payapp/core/components/print_text.dart';
// import 'package:payapp/provider/education_providers/education_provider.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/education_services/community/screens/new_post_screen.dart';
// import 'package:payapp/ui/widgets/app_bar_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:http/http.dart' as http;
// import '../../../../../../themes/colors.dart';
// import '../../../../../../themes/icons_broken.dart';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
//
// class CommunityHomeScreen extends StatefulWidget {
//   const CommunityHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
// }
//
// class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
//   List<IconData> actionsIcons = [
//     // Icons.cast_sharp,
//     // Icons.notifications_outlined,
//     Icons.search,
//     Icons.account_circle
//   ];
//   List<String> categories = [
//     "All",
//     "Stoves",
//     "Baking",
//     "Movies",
//     "Flutter",
//     "React Native",
//     "Coding is Love"
//   ];
//
//   String selectedCategory = "All";
//
//   List items = [];
//
//   Future<void> fetchData() async {
//     var apiUrl =
//         Uri.parse('https://xyzabc.sambhavapps.com/v1/education/community/post');
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("Login token ${prefs.getString('token')}");
//     String token = prefs.getString('token') ?? '';
//     var response = await http.get(
//       apiUrl,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         items = jsonData["data"];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     // loadData();
//     final communityProvider =
//         Provider.of<EductionFormProvider>(context, listen: false);
//     communityProvider.getCoGroups();
//     communityProvider.getCoPosts();
//     communityProvider.isLoadingCategorised = true;
//   }
//
//   int currentIndex = 0;
//
//   // void loadData() async {
//   //   SambhavTubeModel videosJson = await ApiService.fetchsambhavtube();
//   //   SambhavTubeModel videosData = videosJson;
//   //   setState(() {
//   //     videos = videosData as List<SambhavTubeModel>;
//   //   });
//   // }
//
//   final controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: const AppBarWidget(
//         title: 'Community Feeds',
//         size: 55,
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             InkWell(
//               borderRadius: BorderRadius.circular(10),
//               onTap: () {
//                 RouteConfig.navigateToRTL(context, NewPostScreen());
//               },
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           child: Icon(
//                             Icons.person,
//                           ),
//                         ),
//                         const SizedBox(width: 15),
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 12),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: const Text(
//                               "What's in your mind?",
//                               textAlign: TextAlign.start,
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const IgnorePointer(
//                       ignoring: true,
//                       child: AddImageToPost(ignoring: true),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return buildSingleItem(
//                     index: index,
//                     media: items[index]["media"],
//                     size: size,
//                     title: items[index]["title"]);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Card buildSingleItem(
//       {required Size size,
//       required int index,
//       required String title,
//       required List media}) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: const EdgeInsets.all(10),
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.only(),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: 80,
//               child: Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                       radius: 32,
//                       backgroundColor: ThemeColors.darkBlueColor,
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                             'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0'),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 120,
//                                   child: Text(
//                                     'Umika ' * 6,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ),
//                                 const Icon(
//                                   Icons.check_circle,
//                                   color: Colors.blue,
//                                   size: 18,
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: InkWell(
//                                 onTap: () {},
//                                 child: Text(
//                                   index.isEven ? 'Follow' : 'Following',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blue,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           '09:00 PM',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 11,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: Column(children: [
//                   CarouselSlider(
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       aspectRatio: 2.0,
//                       enlargeCenterPage: true,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           currentIndex = index;
//                         });
//                       },
//                     ),
//                     items: media.map((url) {
//                       return Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         clipBehavior: Clip.antiAlias,
//                         elevation: 5,
//                         child: Image.network(
//                           url,
//                           height: 210,
//                           fit: BoxFit.cover,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   DotsIndicator(
//                     dotsCount: media.length,
//                     position: currentIndex.toInt(),
//                   )
//                 ])),
//                 Container(
//                   height: 210,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: ThemeColors.white,
//                   ),
//                   margin: const EdgeInsets.all(5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         borderRadius: BorderRadius.circular(200),
//                         onTap: () {},
//                         child: const Icon(
//                           IconBroken.Heart,
//                           color: ThemeColors.darkBlueColor,
//                           size: 28,
//                         ),
//                       ),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(200),
//                         onTap: () {
//                           printThis('text text ');
//                         },
//                         child: const Icon(
//                           IconBroken.Chat,
//                           color: ThemeColors.darkBlueColor,
//                           size: 28,
//                         ),
//                       ),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(200),
//                         onTap: () {},
//                         child: const Icon(
//                           IconBroken.Send,
//                           color: ThemeColors.darkBlueColor,
//                           size: 28,
//                         ),
//                       ),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(200),
//                         onTap: () {},
//                         child: const Icon(
//                           Iconsax.more,
//                           color: ThemeColors.darkBlueColor,
//                           size: 28,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 "Use API to programmatically accept cryptocurrency. Use API to programmatically accept cryptocurrency. Use API to programmatically accept cryptocurrency",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// // PreferredSizeWidget navBar(BuildContext context) {
// //   var cogroupsProvider = Provider.of<EductionFormProvider>(context,listen: false);
// //   return ScrollAppBar(
// //     controller: controller,
// //     title: Text('Community'),
// //     bottom: PreferredSize(
// //             preferredSize: const Size.fromHeight(50.0),
// //             child: SingleChildScrollView(
// //               scrollDirection: Axis.horizontal,
// //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //               child: Row(
// //                 children: [
// //                   Wrap(
// //                       spacing: 5,
// //                       children: cogroupsProvider.coGroupslist
// //                           .map((category) => FilterChip(
// //                               showCheckmark: false,
// //                               label: Text(
// //                                 category.group_name,
// //                                 style: TextStyle(
// //                                     color: selectedCategory == category
// //                                         ? Colors.white
// //                                         : Colors.black),
// //                               ),
// //                               backgroundColor: Colors.grey.shade200,
// //                               selectedColor: Colors.grey.shade600,
// //                               selected: selectedCategory == category,
// //                               onSelected: (bool value) {}))
// //                           .toList())
// //                 ],
// //               ),
// //             )
// //           ),
// //   );
// // }
// }
