import 'package:flutter/services.dart';
import '../../../../../../src/src.dart';
import '../../../widgets/widgets.dart';

class SilverWidget extends StatelessWidget {
  const SilverWidget({super.key, required this.rate});
  final RatesData rate;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ThemeColors.backgroundLightBlue,
          ),
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: const Text(
            'Buy/Sell Silver',
          ),
          bottom: const TabBar(
              indicatorColor: Colors.indigo,
              indicatorWeight: 3,
              labelColor: Colors.indigo,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              tabs: [
                Tab(
                  text: 'Buy Silver',
                ),
                Tab(text: 'Sell Silver'),
              ]),
        ),
        body: TabBarView(
          children: [
            BuySilverWidget(
              rate: rate,
            ),
            SellSilverWidget(
              rate: rate,
              image:
                  "https://rosabullion.com.au/wp-content/uploads/2023/11/1-kg-silver.png",
            ),
          ],
        ),
      ),
    );
  }
}
