import 'package:flutter/services.dart';
import '../../../../../../src/src.dart';
import '../../../widgets/widgets.dart';

class GoldWidget extends StatelessWidget {
  const GoldWidget({super.key, required this.rate, this.gram = "1"});
  final RatesData rate;
  final String? gram;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ThemeColors.backgroundLightBlue),
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: const Text(
            'Buy/Sell Gold',
          ),
          bottom: const TabBar(
              indicatorColor: Colors.indigo,
              indicatorWeight: 3,
              labelColor: Colors.indigo,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              tabs: [
                Tab(
                  text: 'Buy Gold',
                ),
                Tab(text: 'Sell Gold'),
              ]),
        ),
        body: TabBarView(
          children: [
            BuyGoldWidget(
              rate: rate,
              controller: TextEditingController(text: gram),
              amountController: TextEditingController(
                  text: (double.parse(rate.rates!.gBuy.toString()) *
                          int.parse(gram.toString()))
                      .toString()),
            ),
            SellGoldWidget(
              image:
                  "https://www.royalmint.com/globalassets/bullion/images/products/bars/rmr/rmgcgkb.png",
              rate: rate,
            ),
          ],
        ),
      ),
    );
  }
}
