import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/walletProvider.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/walletTransactionTile.dart';


class LifeTimeHistoryScreen extends StatefulWidget {
  const LifeTimeHistoryScreen({super.key});

  @override
  State<LifeTimeHistoryScreen> createState() => _LifeTimeHistoryScreenState();
}

class _LifeTimeHistoryScreenState extends State<LifeTimeHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: const AppBarWidget(
        title: "History",
        size: 55,
      ),
      body: Consumer<WalletProvider>(builder: (context,walletProvider,child){
        return walletProvider.loading? const Center(child: CircularProgressIndicator()):ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            itemBuilder: (_, index) {
              return WalletTransactionTile(amount: walletProvider.walletModel!.transactions[index].amount.toString(),date: walletProvider.walletModel!.transactions[index].date.toString(),message: walletProvider.walletModel!.transactions[index].message.toString(),);
            },
            separatorBuilder: (_, index) {
              return const SizedBox(height: 15,);
            },
            itemCount: walletProvider.walletModel!.transactions.length);
      }),
    );
  }
}
