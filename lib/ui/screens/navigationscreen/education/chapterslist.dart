// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import '../../../../provider/education_providers/education_provider.dart';
// import '../../../../provider/loginSignUpProvider.dart';
// import '../../../widgets/noteswidget.dart';

// class chapterlist extends StatefulWidget {
//   final String id;
//   const chapterlist({super.key, required this.id});

//   @override
//   State<chapterlist> createState() => _chapterlistState();
// }

// class _chapterlistState extends State<chapterlist> {
//   @override
//   void initState() {
//     super.initState();
//     final notesProvider =
//         Provider.of<EductionFormProvider>(context, listen: false);
//     final userProvider =
//         Provider.of<LoginSignUpProvider>(context, listen: false);
//     // notesProvider.getNotes(id: widget.id, userId: userProvider.userModel!.id);
//     notesProvider.isLoadingCategorised = true;
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
//                   "Notes",
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
//                 builder: (context, notesProvider, child) {
//               return notesProvider.isLoadingCategorised
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
//                       itemCount: notesProvider.notesList.length,
//                       itemBuilder: (context, index) {
//                         return NotesTileWidget(
//                           notes: notesProvider.notesList[index],
//                           onTap: () {},
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
