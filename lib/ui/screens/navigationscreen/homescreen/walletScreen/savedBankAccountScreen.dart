import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/homescreen/walletScreen/withdarawAmountScreen.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/body/notification_body.dart';
import '../../../../../provider/walletProvider.dart';
import '../../../../widgets/app_bar_widget.dart';
import 'addBankForm.dart';

class SelectBankScreen extends StatefulWidget {
  const SelectBankScreen(
      {super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<SelectBankScreen> createState() => _SelectBankScreenState();
}

class _SelectBankScreenState extends State<SelectBankScreen> {
  @override
  void initState() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    walletProvider.getBanks();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBarWidget(
        title: "Select Bank",
        size: 55,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AddBankForm(
                          languages: widget.languages,
                          body: widget.body,
                        )),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          return walletProvider.savedBanks.isEmpty
              ? _buildNoDataFound()
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.shade50, spreadRadius: 10)
                        ],
                      ),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.black.withOpacity(.05),
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WithdrawAmountScreen(
                                  bankModel: walletProvider.savedBanks[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.account_balance, size: 30),
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      walletProvider
                                          .savedBanks[index].accountHolderName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      walletProvider
                                          .savedBanks[index].accountNumber,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: .5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      walletProvider.savedBanks[index].bankName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      walletProvider.savedBanks[index].ifscCode,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: walletProvider.savedBanks.length,
                );
        },
      ),
    );
  }

  _buildNoDataFound() => Container(
        alignment: Alignment.center,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: const Text('No banks data was found!'),
      );
}
