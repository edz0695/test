import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/provider/earn_providers/earn_screen_provider.dart';
import 'package:provider/provider.dart';
import '../sub_screens/all_offers_screen.dart';

class BanksListView extends StatefulWidget {
  const BanksListView({super.key});

  @override
  State<BanksListView> createState() => _BanksListViewState();
}

class _BanksListViewState extends State<BanksListView> {
  int selectedIndex = 0;

  List<String> banks = [
    'Credit Cards',
    'Bank Accounts',
    'Demat Accounts',
    'Personal Leans',
    'Credit Lines',
    'ITR & TAX',
  ];
  List<String> lotties = [
    'assets/lottie/card_payment.json',
    'assets/lottie/bank.json',
    'assets/lottie/card_visa.json',
    'assets/lottie/money_bag.json',
    'assets/lottie/credit-card.json',
    'assets/lottie/mony_bag.json',
  ];

  @override
  Widget build(BuildContext context) {

    return Consumer<EarnScreenProvider>(
        builder: (context, gmoProvider, child) {
          return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        itemCount: banks.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildBankTab(
          name: banks[index],
          selected: selectedIndex == index,
          onTap: () => setState(() {
            selectedIndex = index;
            if(selectedIndex==0){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllOffersScreen(Allcata: true,
                    categoryId: gmoProvider
                        .earnMainModel!.activeCategories[index].id,
                  ),
                ),
              );
            }
          }),
          lottie: lotties[index],
        ),
      ),
    );
  });
}}

InkWell buildBankTab({
  required String name,
  required VoidCallback onTap,
  required bool selected,
  required String lottie,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      //height: 50,
      // width: 120,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: selected
              ? [
            const Color(0xff2057A6),
            Colors.blue,
                ]
              : [
                 const Color(0xffFFFFFF),
                 const Color(0xffffffff),

                ],
        ),

        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 2), // Position of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Lottie.asset(lottie),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),

              Text(
                'earn up to €46554',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
