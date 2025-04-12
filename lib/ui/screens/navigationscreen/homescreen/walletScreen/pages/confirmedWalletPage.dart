import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../provider/walletProvider.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/walletTransactionTile.dart';

class ConfirmedWalletPage extends StatefulWidget {
  const ConfirmedWalletPage({super.key});

  @override
  State<ConfirmedWalletPage> createState() => _ConfirmedWalletPageState();
}

class _ConfirmedWalletPageState extends State<ConfirmedWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(builder: (context, walletProvider, child) {
      return walletProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : walletProvider.walletModel!.conformTransactions.isEmpty
              ? const Center(
                  child: Text(
                    "No Transactions.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                )
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  itemBuilder: (_, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          const Text(
                            "Confirmed amount text",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Confirmed",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Consumer<WalletProvider>(builder:
                                        (context, walletProvider, child) {
                                      return walletProvider.loading
                                          ? const ShimmerAnimation(
                                              height: 20,
                                              width: 100,
                                            )
                                          : Text(
                                              walletProvider
                                                  .walletModel!.confirmed
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: ThemeColors
                                                    .primaryBlueColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                    })
                                  ],
                                ),
                                const Icon(
                                  Icons.wallet,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return WalletTransactionTile(
                      amount: walletProvider
                          .walletModel!.conformTransactions[index - 1].amount
                          .toString(),
                      date: walletProvider
                          .walletModel!.conformTransactions[index - 1].date
                          .toString(),
                      message: walletProvider
                          .walletModel!.conformTransactions[index - 1].message
                          .toString(),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount:
                      walletProvider.walletModel!.conformTransactions.length +
                          1);
    });
  }
}
