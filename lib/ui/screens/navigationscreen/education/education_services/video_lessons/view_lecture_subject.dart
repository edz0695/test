import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/video_lessons/select_video_lecture_chapter.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/themes/colors.dart';

class AllVideoSubjects extends StatelessWidget {
  const AllVideoSubjects({super.key});

  static const String slidImage =
      "https://www.shutterstock.com/shutterstock/photos/1718671960/display_1500/"
      "stock-vector-online-webinar-vector-template-mock-up-for-busines-conference-"
      "announcement-abstract-blue-halftone-1718671960.jpg";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarWidget(title: 'Video Lessons', size: 55),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: 2,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      slidImage,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        printThis(error.toString());
                        printThis(stackTrace.toString());
                        return const Stack(
                          alignment: Alignment.center,
                          children: [
                            ShimmerAnimation(),
                            Text(
                                'Network is not good! \nor the link is not found!'),
                          ],
                        );
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const ShimmerAnimation();
                      },
                    ),
                  ),
                ),
              ),
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
            ),
            const SizedBox(height: 30),
            const Text(
              "Select Subject",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ThemeColors.primaryBlueColor,
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: FutureBuilder<String>(
                future: _loadToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String token = snapshot.data ?? '';
                    return FutureBuilder(
                      future: _callApiWithToken(token),
                      builder: (context, apiSnapshot) {
                        if (apiSnapshot.connectionState ==
                            ConnectionState.done) {
                          var res = apiSnapshot.data;
                          if (res is List) {
                            print("Length : ");
                            return ListView.builder(
                              itemCount: res.length,
                              itemBuilder: (context, index) {
                                return buildSingleChapter(
                                  size: size,
                                  title: res[index]["name"],
                                  subTitle: "30 Videos",
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectVideoLacChapter(
                                                subjectName: res[index]["name"],
                                                subjectId: res[index]["id"],
                                                logo: res[index]["logo"],
                                              ))),
                                  image: res[index]["logo"],
                                );
                              },
                            );
                          }

                          return Text(res.toString());
                        } else {
                          return Text("Loading");
                        }
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            // buildSingleChapter(
            //   size: size,
            //   title: "Physic",
            //   subTitle: "30 Videos",
            //   onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const SelectVideoLacChapter())),
            //   image: "assets/education/logarithm.png",
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  InkWell buildSingleChapter({
    required Size size,
    required String title,
    required String subTitle,
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  image,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.primaryBlueColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Text(
                    //   subTitle,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     color: Colors.grey,
                    //     fontSize: 12,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.double_arrow_outlined,
                color: ThemeColors.primaryBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ??
        ''; // Default to empty string if token is not found
  }

  Future _callApiWithToken(String token) async {
    try {
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/subject');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);

        return decodedResponse["data"];
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error calling API: $error');
    }
  }
}
