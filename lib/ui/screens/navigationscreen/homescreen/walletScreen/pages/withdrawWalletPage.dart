import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/animations/shimmer_animation.dart';
import '../../../../../../core/utils/helper/helper.dart';
import '../../../../../../data/model/body/notification_body.dart';
import '../../../../../../provider/walletProvider.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../widgets/walletTransactionTile.dart';
import '../addBankForm.dart';
import '../savedBankAccountScreen.dart';

class WithdrawWalletPage extends StatefulWidget {
  const WithdrawWalletPage(
      {super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<WithdrawWalletPage> createState() => _WithdrawWalletPageState();
}

class _WithdrawWalletPageState extends State<WithdrawWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(builder: (context, walletProvider, child) {
      return walletProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : walletProvider.walletModel!.withdrawableTransactions.isEmpty
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
                            "Withdrawable amount text",
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
                                      "Wallet Balance",
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
                                                  .walletModel!.balance
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: ThemeColors
                                                    .primaryBlueColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                    }),
                                  ],
                                ),
                                const Icon(
                                  Icons.wallet,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(15),
                            color: ThemeColors.primaryBlueColor,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.white.withOpacity(.2),
                              onTap: () async {
                                final walletProvider =
                                    Provider.of<WalletProvider>(context,
                                        listen: false);
                                await walletProvider.getBanks().then((value) {
                                  final list = value as List;
                                  if (list.isEmpty) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) => AddBankForm(
                                                  languages: widget.languages,
                                                  body: widget.body,
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) =>
                                                SelectBankScreen(
                                                  languages: widget.languages,
                                                  body: widget.body,
                                                )));
                                  }
                                }).onError((error, stackTrace) =>
                                    showScaffold(context, "$error"));

                                // Withdrawal
                                // final walletProvider = Provider.of<WalletProvider>(context,listen: false);
                                // walletProvider.addBank(bankModel: bankModel)
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .6,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    "WithDrawal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }
                    return WalletTransactionTile(
                      amount: walletProvider.walletModel!
                          .withdrawableTransactions[index - 1].amount
                          .toString(),
                      date: walletProvider
                          .walletModel!.withdrawableTransactions[index - 1].date
                          .toString(),
                      message: walletProvider.walletModel!
                          .withdrawableTransactions[index - 1].message
                          .toString(),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: walletProvider
                          .walletModel!.withdrawableTransactions.length +
                      1);
    });
  }
}
