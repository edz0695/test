import 'package:flutter/material.dart';
import '../../../../../../themes/colors.dart';
import '../Widgets/card.dart';
import '../Widgets/recentActivityTile.dart';

class PendingWalletPage extends StatefulWidget {
  const PendingWalletPage({super.key});

  @override
  State<PendingWalletPage> createState() => _PendingWalletPageState();
}

class _PendingWalletPageState extends State<PendingWalletPage> {
  @override
  Widget build(BuildContext context) {
    final List<RecentActivityModel> datas = [
      RecentActivityModel(
          name: "Prateek Singh",
          imagePath:
              "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Free-Image.png",
          subtitle: "Send Money",
          amount: "588",
          date: "25-02-20024",
          time: "2:00pm"),
      RecentActivityModel(
          name: "Prateek Singh",
          imagePath:
              "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
          subtitle: "Send Money",
          amount: "-200",
          date: "25-02-20024",
          time: "2:00pm"),
      RecentActivityModel(
          name: "Prateek Singh",
          imagePath:
              "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
          subtitle: "Send Money",
          amount: "588",
          date: "25-02-20024",
          time: "2:00pm"),
      RecentActivityModel(
          name: "Prateek Singh",
          imagePath:
              "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
          subtitle: "Send Money",
          amount: "588",
          date: "25-02-20024",
          time: "2:00pm")
    ];
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 230,
          child: WalletCard(walletBalance: "24,562.00", walletCurrency: "\$"),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Activity",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.blueColor1,
                    fontSize: 17),
              ),
              Row(
                children: [
                  Text(
                    "See all",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 13,
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                final data = datas[index];
                return RecentActivityTile(data: data);
              }),
        ),
      ]),
    );
    // return Consumer<WalletProvider>(builder: (context, walletProvider, child) {
    //   return walletProvider.loading
    //       ? const Center(child: CircularProgressIndicator())
    //       : walletProvider.walletModel!.pendingTransactions.isEmpty
    //           ? const Center(
    //               child: Text(
    //                 "No Transactions.",
    //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    //               ),
    //             )
    //           : ListView.separated(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    //               itemBuilder: (_, index) {
    //                 if (index == 0) {
    //                   return Column(
    //                     children: [
    //                       const Text(
    //                         "Pending amount text",
    //                         style: TextStyle(
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 20, vertical: 30),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 const Text(
    //                                   "Pending",
    //                                   style: TextStyle(
    //                                     fontSize: 20,
    //                                     fontWeight: FontWeight.w400,
    //                                   ),
    //                                 ),
    //                                 const SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Consumer<WalletProvider>(builder:
    //                                     (context, walletProvider, child) {
    //                                   return walletProvider.loading
    //                                       ? const ShimmerAnimation(
    //                                           height: 20,
    //                                           width: 100,
    //                                         )
    //                                       : Text(
    //                                           walletProvider
    //                                               .walletModel!.pending
    //                                               .toString(),
    //                                           style: const TextStyle(
    //                                             fontSize: 24,
    //                                             color: ThemeColors.primaryBlueColor,
    //                                             fontWeight: FontWeight.w700,
    //                                           ),
    //                                         );
    //                                 }),
    //                               ],
    //                             ),
    //                             const Icon(
    //                               Iconsax.wallet,
    //                               size: 40,
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                       ),
    //                     ],
    //                   );
    //                 }
    //                 return WalletTransactionTile(
    //                   amount: walletProvider
    //                       .walletModel!.pendingTransactions[index - 1].amount
    //                       .toString(),
    //                   date: walletProvider
    //                       .walletModel!.pendingTransactions[index - 1].date
    //                       .toString(),
    //                   message: walletProvider
    //                       .walletModel!.pendingTransactions[index - 1].message
    //                       .toString(),
    //                 );
    //               },
    //               separatorBuilder: (_, index) {
    //                 return const SizedBox(
    //                   height: 15,
    //                 );
    //               },
    //               itemCount:
    //                   walletProvider.walletModel!.pendingTransactions.length +
    //                       1);
    // });
  }
}
