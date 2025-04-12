import 'package:get/get.dart';
import 'package:payapp/core/components/tab_indicator.dart';
import '../../../../../data/model/body/notification_body.dart';
import '../../../../../src/src.dart';
import 'Widgets/wallet_balance_card_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.find<WalletController>();
    controller.fetchWalletBalance();
    controller.fetchTransactionHistory();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBar(
          backgroundColor: ThemeColors.backgroundLightBlue,
          leading: back(),
          title: Text("Wallet"),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          final walletBalance = controller.walletBalance.value?.data;
          return controller.walletLoading.value
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(3, -3),
                              color: const Color(0xff2057A6)
                                  .withValues(alpha: 0.2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: TabBar(
                          tabs: const [
                            Tab(
                              text: "Pending",
                            ),
                            Tab(
                              text: "Payout",
                            ),
                            Tab(
                              text: "Confirmed",
                            ),
                          ],
                          unselectedLabelStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                          labelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          dividerColor: Colors.transparent,
                          labelColor: ThemeColors.primaryBlueColor,
                          splashBorderRadius: BorderRadius.circular(10),
                          indicator: const CvTabIndicator(
                            indicatorHeight: 4,
                            indicatorColor: ThemeColors.primaryBlueColor,
                            indicatorSize: CvTabIndicatorSize.normal,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: Colors.grey,
                        ),
                      ),
                      height(30),
                      SizedBox(
                        height: Get.size.height * .21,
                        child: TabBarView(children: [
                          WalletBalanceCardWidget(
                              balance:
                                  walletBalance!.pendingWallet!.toDouble()),
                          WalletBalanceCardWidget(
                              isPayout: true,
                              balance: walletBalance.wallet!.toDouble()),
                          WalletBalanceCardWidget(
                              balance:
                                  walletBalance.confirmedBalance!.toDouble()),
                        ]),
                      ),

                      height(50),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             CupertinoPageRoute(
                      //                 builder: (context) => PayoutForm(
                      //                       showForm: true,
                      //                     )));
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         padding: const EdgeInsets.symmetric(vertical: 5),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(50),
                      //         ),
                      //       ).copyWith(
                      //         backgroundColor:
                      //             WidgetStateProperty.resolveWith<Color>(
                      //           (states) => Colors.transparent,
                      //         ),
                      //         elevation: WidgetStateProperty.all(
                      //             0), // Remove button shadow
                      //       ),
                      //       child: Ink(
                      //         decoration: BoxDecoration(
                      //           color: ThemeColors.blueColor1,
                      //           borderRadius: BorderRadius.circular(50),
                      //           boxShadow: [
                      //             const BoxShadow(
                      //               color: Color(0x14000000),
                      //               offset: Offset(0, 10),
                      //               blurRadius: 20,
                      //             ),
                      //           ],
                      //         ),
                      //         child: Container(
                      //           alignment: Alignment.center,
                      //           constraints: BoxConstraints(
                      //             maxWidth: 125,
                      //             minHeight: 50,
                      //           ),
                      //           child: const Text(
                      //             "Deposit",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 15),
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             CupertinoPageRoute(
                      //                 builder: (context) => PayoutForm(
                      //                       showForm: true,
                      //                     )));
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         padding: const EdgeInsets.symmetric(vertical: 5),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(50),
                      //         ),
                      //       ).copyWith(
                      //         backgroundColor:
                      //             WidgetStateProperty.resolveWith<Color>(
                      //           (states) => Colors.transparent,
                      //         ),
                      //         elevation: WidgetStateProperty.all(
                      //             0), // Remove button shadow
                      //       ),
                      //       child: Ink(
                      //         decoration: BoxDecoration(
                      //           color: ThemeColors.blueColor1,
                      //           borderRadius: BorderRadius.circular(50),
                      //           boxShadow: [
                      //             const BoxShadow(
                      //               color: Color(0x14000000),
                      //               offset: Offset(0, 10),
                      //               blurRadius: 20,
                      //             ),
                      //           ],
                      //         ),
                      //         child: Container(
                      //           alignment: Alignment.center,
                      //           constraints: BoxConstraints(
                      //             maxWidth: 125,
                      //             minHeight: 50,
                      //           ),
                      //           child: const Text(
                      //             "Withdraw",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Transaction",
                          style: TextStyle(
                            fontSize: 15,
                            color: ThemeColors.blueColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      height(16),
                      Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller
                                .transactionHistory.value?.data.length,
                            itemBuilder: (context, index) {
                              final data = controller
                                  .transactionHistory.value?.data[index];
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Color(0x14000000),
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(
                                    data!.mode,
                                    style: TextStyle(
                                        color: ThemeColors.darkBlueColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    data.details,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              color: data.type != 'credit'
                                                  ? Colors.red
                                                  : Colors.green),
                                          child: Text.rich(
                                            TextSpan(
                                              text: data.type != 'credit'
                                                  ? "₹${data.amount}"
                                                  : "+${data.amount.toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        height(5)
                                      ]),
                                ),
                              );
                            }),
                      )

                      /*Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        PendingWalletPage(),
                        PendingWalletPage(),
                        PendingWalletPage(),
                        // WithdrawWalletPage(
                        //   languages: widget.languages,
                        //   body: widget.body,
                        // ),
                        // ConfirmedWalletPage(),
                      ],
                    ),
                  ),*/
                      //   Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //
                      //         Expanded(
                      //
                      //           child: Container(
                      //             height: 100,
                      //
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     color: Colors.black.withOpacity(.1), blurRadius: 10)
                      //               ],
                      //             ),
                      //             child: Material(
                      //               borderRadius: BorderRadius.circular(15),
                      //               color: Colors.white,
                      //               child: InkWell(
                      //                 borderRadius: BorderRadius.circular(15),
                      //                 highlightColor: Colors.transparent,
                      //                 splashColor: Colors.black.withOpacity(.05),
                      //                 onTap: (){
                      //                 },
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(10),
                      //                   child: Column(
                      //                     children: [
                      //                       Expanded(child:Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      //                         return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Center(
                      //                           child: Text(
                      //                             walletProvider.walletModel!.balance.toString(),
                      //                             style: TextStyle(
                      //                               fontSize: 24,
                      //                               color: ThemeColors.blueColor,
                      //                               fontWeight: FontWeight.w700,
                      //                             ),
                      //                           ),
                      //                         );
                      //                       }),),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                       Text(
                      //                         "Balance",
                      //                         style: TextStyle(color: Colors.black, fontSize: 15),
                      //                       ),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Expanded(
                      //
                      //           child: Container(
                      //             height: 100,
                      //
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     color: Colors.black.withOpacity(.1), blurRadius: 10)
                      //               ],
                      //             ),
                      //             child: Material(
                      //               borderRadius: BorderRadius.circular(15),
                      //               color: Colors.white,
                      //               child: InkWell(
                      //                 borderRadius: BorderRadius.circular(15),
                      //                 highlightColor: Colors.transparent,
                      //                 splashColor: Colors.black.withOpacity(.05),
                      //                 onTap: (){
                      //                 },
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(10),
                      //                   child: Column(
                      //                     children: [
                      //                       Expanded(child: Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      //                         return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Center(
                      //                           child: Text(
                      //                             walletProvider.walletModel!.pending.toString(),
                      //                             style: TextStyle(
                      //                               fontSize: 24,
                      //                               color: ThemeColors.blueColor,
                      //                               fontWeight: FontWeight.w700,
                      //                             ),
                      //                           ),
                      //                         );
                      //                       }),),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                       Text(
                      //                         "Pending",
                      //                         style: TextStyle(color: Colors.black, fontSize: 15),
                      //                       ),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Expanded(
                      //
                      //           child: Container(
                      //             height: 100,
                      //
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     color: Colors.black.withOpacity(.1), blurRadius: 10)
                      //               ],
                      //             ),
                      //             child: Material(
                      //               borderRadius: BorderRadius.circular(15),
                      //               color: Colors.white,
                      //               child: InkWell(
                      //                 borderRadius: BorderRadius.circular(15),
                      //                 highlightColor: Colors.transparent,
                      //                 splashColor: Colors.black.withOpacity(.05),
                      //                 onTap: (){
                      //                 },
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(10),
                      //                   child: Column(
                      //                     children: [
                      //                       Expanded(child: Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      //                         return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Center(
                      //                           child: Text(
                      //                             walletProvider.walletModel!.confirmed.toString(),
                      //                             style: TextStyle(
                      //                               fontSize: 24,
                      //                               color: ThemeColors.blueColor,
                      //                               fontWeight: FontWeight.w700,
                      //                             ),
                      //                           ),
                      //                         );
                      //                       }),),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                       Text(
                      //                         "Confirmed",
                      //                         style: TextStyle(color: Colors.black, fontSize: 15),
                      //                       ),
                      //                       SizedBox(
                      //                         height: 10,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      // //         Column(
                      // //           crossAxisAlignment: CrossAxisAlignment.start,
                      // //           children: [
                      // //             Text(
                      // //               "Wallet Balance",
                      // //               style: TextStyle(
                      // //                 fontSize: 20,
                      // //                 fontWeight: FontWeight.w400,
                      // //               ),
                      // //             ),
                      // //             SizedBox(
                      // //               height: 5,
                      // //             ),
                      // //             Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      // //   return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Text(
                      // //     walletProvider.walletModel!.balance.toString(),
                      // //     style: TextStyle(
                      // //       fontSize: 24,
                      // //       color: ThemeColors.blueColor,
                      // //       fontWeight: FontWeight.w700,
                      // //     ),
                      // //   );
                      // // }),
                      // //             const SizedBox(height: 10,),
                      // //             Text(
                      // //               "Pending",
                      // //               style: TextStyle(
                      // //                 fontSize: 20,
                      // //                 fontWeight: FontWeight.w400,
                      // //               ),
                      // //             ),
                      // //             SizedBox(
                      // //               height: 5,
                      // //             ),
                      // //             Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      // //               return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Text(
                      // //                 walletProvider.walletModel!.pending.toString(),
                      // //                 style: TextStyle(
                      // //                   fontSize: 24,
                      // //                   color: ThemeColors.blueColor,
                      // //                   fontWeight: FontWeight.w700,
                      // //                 ),
                      // //               );
                      // //             }),
                      // //             const SizedBox(height: 10,),
                      // //             Text(
                      // //               "Confirmed",
                      // //               style: TextStyle(
                      // //                 fontSize: 20,
                      // //                 fontWeight: FontWeight.w400,
                      // //               ),
                      // //             ),
                      // //             SizedBox(
                      // //               height: 5,
                      // //             ),
                      // //             Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      // //               return walletProvider.loading?ShimmerAnimation(height: 20,width: 100,):Text(
                      // //                 walletProvider.walletModel!.confirmed.toString(),
                      // //                 style: TextStyle(
                      // //                   fontSize: 24,
                      // //                   color: ThemeColors.blueColor,
                      // //                   fontWeight: FontWeight.w700,
                      // //                 ),
                      // //               );
                      // //             })
                      // //
                      // //           ],
                      // //         ),
                      // //         Icon(
                      // //           Iconsax.wallet,
                      // //           size: 40,
                      // //         )
                      //       ],
                      //     ),
                      //   ),
                      //   Material(
                      //     borderRadius: BorderRadius.circular(15),
                      //     color: ThemeColors.blueColor,
                      //     child: InkWell(
                      //       borderRadius: BorderRadius.circular(15),
                      //       highlightColor: Colors.transparent,
                      //       splashColor: Colors.white.withOpacity(.2),
                      //       onTap: () async {
                      //         final walletProvider = Provider.of<WalletProvider>(context,listen: false);
                      //         await walletProvider.getBanks().then((value) {
                      //           final list = value as List;
                      //           if(list.isEmpty){
                      //             Navigator.push(context, CupertinoPageRoute(
                      //                 fullscreenDialog: true,
                      //                 builder: (context)=> const AddBankForm()));
                      //           }
                      //           else{
                      //             Navigator.push(context, CupertinoPageRoute(
                      //                 fullscreenDialog: true,
                      //                 builder: (context)=> const SelectBankScreen()));
                      //           }
                      //         }).onError((error, stackTrace) => showScaffold(context, "$error"));
                      //
                      //
                      //
                      //
                      //         // Withdrawal
                      //         // final walletProvider = Provider.of<WalletProvider>(context,listen: false);
                      //         // walletProvider.addBank(bankModel: bankModel)
                      //       },
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width*.6,
                      //         padding: const EdgeInsets.all(15),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(15),
                      //             ),
                      //         child: const Center(
                      //           child: Text(
                      //             "WithDrawal",
                      //             style: TextStyle(
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Colors.white),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   const SizedBox(height: 10,),
                      //
                      //   Expanded(
                      //
                      //       child: Consumer<WalletProvider>(builder: (context,walletProvider,child){
                      //         return walletProvider.loading? const Center(child: CircularProgressIndicator()):ListView.separated(
                      //             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      //             itemBuilder: (_, index) {
                      //               return WalletTransactionTile(amount: walletProvider.walletModel!.transactions[index].amount.toString(),date: walletProvider.walletModel!.transactions[index].date.toString(),message: walletProvider.walletModel!.transactions[index].message.toString(),);
                      //             },
                      //             separatorBuilder: (_, index) {
                      //               return const SizedBox(height: 15,);
                      //             },
                      //             itemCount: walletProvider.walletModel!.transactions.length);
                      //       }),
                      //
                      //
                      //
                      //   )
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
