// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import '../../../../provider/education_providers/education_provider.dart';
// import '../../../widgets/subjectwidget.dart';
// import 'chapterslist.dart';

// class Subjectlist extends StatefulWidget {
//   const Subjectlist({super.key});

//   @override
//   State<Subjectlist> createState() => _SubjectlistState();
// }

// class _SubjectlistState extends State<Subjectlist> {
//   @override
//   void initState() {
//     super.initState();
//     final subjectProvider =
//         Provider.of<EductionFormProvider>(context, listen: false);
//     subjectProvider.getSubjects();
//     subjectProvider.isLoadingCategorised = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: Row(
//               children: [
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                       borderRadius: BorderRadius.circular(200),
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Icon(
//                           Icons.arrow_left,
//                           size: 25,
//                         ),
//                       )),
//                 ),
//                 Expanded(
//                     child: Center(
//                         child: Text(
//                   "Select Subjects",
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w500, letterSpacing: 1),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ))),
//                 const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     height: 25,
//                     width: 25,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Consumer<EductionFormProvider>(
//                 builder: (context, subjectProvider, child) {
//               return subjectProvider.isLoadingCategorised
//                   ? const Center(
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                       ),
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.only(
//                           left: 15, right: 15, bottom: 100),
//                       physics: const BouncingScrollPhysics(
//                           parent: AlwaysScrollableScrollPhysics()),
//                       itemCount: subjectProvider.subjectsList.length,
//                       itemBuilder: (context, index) {
//                         return SubjectTileWidget(
//                           subject: subjectProvider.subjectsList[index],
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => chapterlist(
//                                         id: subjectProvider.subjectsList[index]
//                                             .data.first.id)));
//                           },
//                         );
//                       },
//                     );
//             }),
//           )
//         ],
//       )),
//     );
//   }
// }
