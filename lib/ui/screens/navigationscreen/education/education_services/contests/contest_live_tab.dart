// import 'package:flutter/material.dart';
// import 'package:payapp/ui/screens/navigationscreen/education/education_services/contests/widgets/contests_tile.dart';
// import 'package:provider/provider.dart';

// import '../../../../../../provider/education_providers/education_provider.dart';



// class ContestLiveTap extends StatefulWidget {
//   const ContestLiveTap({super.key});

//   @override
//   State<ContestLiveTap> createState() => _ContestLiveTapState();
// }

// class _ContestLiveTapState extends State<ContestLiveTap> {
//   final bool _isExpanded = false;

//   @override
//   void initState() {

//     super.initState();
//     final subjectProvider =
//         Provider.of<EductionFormProvider>(context, listen: false);
//     subjectProvider.getContests();
//     subjectProvider.isLoadingCategorised = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<EductionFormProvider>(
//         builder: (context, contestProvider, child) {
//       return contestProvider.isLoadingCategorised
//           ? const Center(
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
//               physics: const BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics()),
//               itemCount: contestProvider.contestlist.length,
//               itemBuilder: (context, index) {
//                 return ContestTileWidget(
//                     contest: contestProvider.contestlist[index], onTap: () {});
//               });
//     });
//   }
// }
