// import 'package:flutter/material.dart';
// import 'package:payapp/themes/colors.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/education_services/single-chapter/qustions.dart';
// import 'package:payapp/ui/widgets/app_bar_widget.dart';
//
// class SingleChapter extends StatefulWidget {
//   final String examName;
//   final String subjectName;
//   final String subjectId;
//
//   const SingleChapter({
//     Key? key,
//     required this.examName,
//     required this.subjectName,
//     required this.subjectId,
//   }) : super(key: key);
//
//   @override
//   State<SingleChapter> createState() => _SingleChapterState();
// }
//
// class _SingleChapterState extends State<SingleChapter> {
//   bool class11 = false;
//   bool class12 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery
//         .of(context)
//         .size;
//     return Scaffold(
//       appBar: AppBarWidget(
//         title: "JEE Main > Physics",
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.bookmark_border),
//             color: ThemeColors.primaryBlueColor,
//           ),
//           IconButton(
//             onPressed: () => filter(),
//             icon: const Icon(Icons.sort_outlined),
//             color: ThemeColors.primaryBlueColor,
//           ),
//         ],
//         size: 55,
//       ),
//       body: SingleChildScrollView(
//         padding:
//         const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   "assets/education/physics-2.png",
//                   width: 40,
//                   height: 40,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Physics",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "32 Chapter, 302 Qs",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black54),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             buildSingleChapter(
//                 size: size,
//                 title: "Mathematics for Physic",
//                 subTitle: "30 Qs",
//                 onTap: () =>
//                     Navigator.push(context,
//                         MaterialPageRoute(
//                             builder: (context) => const Questions())),
//                 image: "assets/education/logarithm.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Unit & Dimensions",
//                 subTitle: "75 Qs",
//                 onTap: () {},
//                 image: "assets/education/dimension.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In One Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-one.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In Two Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-two.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Mathematics for Physic",
//                 subTitle: "30 Qs",
//                 onTap: () {},
//                 image: "assets/education/logarithm.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Unit & Dimensions",
//                 subTitle: "75 Qs",
//                 onTap: () {},
//                 image: "assets/education/dimension.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In One Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-one.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In Two Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-two.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Mathematics for Physic",
//                 subTitle: "30 Qs",
//                 onTap: () {},
//                 image: "assets/education/logarithm.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Unit & Dimensions",
//                 subTitle: "75 Qs",
//                 onTap: () {},
//                 image: "assets/education/dimension.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In One Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-one.png"),
//             buildSingleChapter(
//                 size: size,
//                 title: "Motion In Two Dimension",
//                 subTitle: "60 Qs",
//                 onTap: () {},
//                 image: "assets/education/motion-two.png"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   filter() async {
//     var size = MediaQuery
//         .of(context)
//         .size;
//     showModalBottomSheet(
//         context: context,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(40), topLeft: Radius.circular(40)),
//         ),
//         builder: (context) {
//           return StatefulBuilder(builder: (context, setState) {
//             return SizedBox(
//               width: size.width,
//               height: size.height * .40,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                       padding: const EdgeInsets.all(30),
//                       child: Column(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Class",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black54),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class11,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class11 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("Class 11")
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class12,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class12 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("Class 12")
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Importance",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black54),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class11,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class11 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("Hight Output Low Input")
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class12,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class12 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("Low Input High Output")
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class11,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class11 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("Low Output to Low Output")
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: Checkbox(
//                                       value: class12,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           class12 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Text("High Output to High Output")
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       )),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Divider(
//                     height: 1,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           "Filter",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 15,
//                               color: Colors.black45),
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   class11 = false;
//                                   class12 = false;
//                                 });
//                               },
//                               child: const Text(
//                                 "Clear",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                     color: Colors.red),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   class11 = false;
//                                   class12 = false;
//                                 });
//                                 Navigator.pop(context);
//                               },
//                               child: const Text(
//                                 "Apply Now",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                     color: ThemeColors.primaryBlueColor),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           });
//         });
//   }
//
//   InkWell buildSingleChapter({
//     required Size size,
//     required String title,
//     required String subTitle,
//     required String image,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: size.width,
//         padding:
//         const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//         margin: const EdgeInsets.only(bottom: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(1, 1),
//                 color: ThemeColors.primaryBlueColor.withOpacity(0.2),
//                 blurRadius: 5.0,
//                 spreadRadius: 3),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   image,
//                   width: 40,
//                   height: 40,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                           fontSize: 15),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       subTitle,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black54,
//                           fontSize: 12),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             InkWell(
//                 onTap: () {},
//                 child: const Icon(
//                   Icons.double_arrow_outlined,
//                   color: ThemeColors.primaryBlueColor,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/single-chapter/qustions.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleChapter extends StatefulWidget {
  final String examName;
  final String subjectName;
  final String subjectId;
  final String subjectLogo;

  const SingleChapter(
      {super.key,
      required this.examName,
      required this.subjectName,
      required this.subjectId,
      required this.subjectLogo});

  @override
  State<SingleChapter> createState() => _SingleChapterState();
}

class _SingleChapterState extends State<SingleChapter> {
  late List chapters = [];

  @override
  void initState() {
    super.initState();
    fetchChapters();
  }

  Future<void> fetchChapters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('token');
    final url = 'https://xyzabc.sambhavapps.com/v1/education/quiz/chapter';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body)["data"];
        chapters.clear(); // Clear existing chapters before adding new ones
        print(data);
        data.forEach((e) {
          if (e["subject_id"]["id"] == widget.subjectId) {
            chapters.add(e);
          }
        });
      });
    } else {
      throw Exception('Failed to load chapters');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: "${widget.examName} > ${widget.subjectName}",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
            color: ThemeColors.primaryBlueColor,
          ),
          IconButton(
            onPressed: () => filter(),
            icon: const Icon(Icons.sort_outlined),
            color: ThemeColors.primaryBlueColor,
          ),
        ],
        size: 55,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  widget.subjectLogo,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${chapters.length} Chapters",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // Display chapters fetched from API
            Column(
              children: chapters.map((chapter) {
                return buildSingleChapter(
                  size: size,
                  title: chapter['chapter_name'],
                  subTitle: '',
                  // Adjust this as needed
                  onTap: () {
                    // Navigate to chapter details page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Questions(
                            categoryId: chapter["id"],
                            examName: widget.examName,
                            subjectName: widget.subjectName,
                            chapterName: chapter["chapter_name"],
                          ),
                        ));
                  },
                  image: chapter['chapter_logo'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Your existing filter method
  void filter() {
    // Implement your filter functionality here
    // This method is unchanged
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
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              color: ThemeColors.primaryBlueColor.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (image.isNotEmpty)
                  Image.network(
                    image,
                    width: 50,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(width: 20),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
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
}
