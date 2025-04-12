import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/video_lessons/single_video_lecture.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../themes/colors.dart';

class SelectVideoLacChapter extends StatefulWidget {
  final String logo;
  final String subjectName;
  final String subjectId;

  const SelectVideoLacChapter({
    super.key,
    required this.logo,
    required this.subjectName,
    required this.subjectId,
  });

  @override
  State<SelectVideoLacChapter> createState() => _SelectVideoLacChapterState();
}

class _SelectVideoLacChapterState extends State<SelectVideoLacChapter> {
  @override
  Widget build(BuildContext context) {
    Future<String> loadToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token') ??
          ''; // Default to empty string if token is not found
    }

    Future callApiWithToken(String token) async {
      try {
        // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
        var apiUrl = Uri.parse(
            'https://xyzabc.sambhavapps.com/v1/education/chapter/subject/${widget.subjectId}');

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

    print("SUBJECT ID>>>>> ${widget.subjectId}");
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(
        title: '',
        size: 50,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  widget.logo,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subjectName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.primaryBlueColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "32 Chapter, 302 Video Lacturs",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Select Chapter",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ThemeColors.primaryBlueColor,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: FutureBuilder<String>(
                future: loadToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String token = snapshot.data ?? '';
                    return FutureBuilder(
                      future: callApiWithToken(token),
                      builder: (context, apiSnapshot) {
                        if (apiSnapshot.connectionState ==
                            ConnectionState.done) {
                          var res = apiSnapshot.data;
                          if (res is List) {
                            return ListView.builder(
                              itemCount: res.length,
                              itemBuilder: (context, index) {
                                print(
                                    "Index : $index Logo: ${res[index]["logo"]}");
                                return buildSingleChapter(
                                  size: size,
                                  title: res[index]["name"],
                                  subTitle: "30 Videos",
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingleVideoLac(
                                                logo: res[index]["logo"],
                                                chapterId: res[index]["id"],
                                                chapterName: res[index]["name"],
                                              ))),
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
            //     size: size,
            //     title: "Chemical Bonding",
            //     subTitle: "87 Videos",
            //     onTap: () {}),
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
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: size.width,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.primaryBlueColor,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.double_arrow_outlined,
                  color: ThemeColors.primaryBlueColor,
                ))
          ],
        ),
      ),
    );
  }
}
