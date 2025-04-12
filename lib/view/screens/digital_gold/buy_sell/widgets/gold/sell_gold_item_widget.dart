import 'package:get/get.dart';

import '../../../../../../src/src.dart';
import '../../../widgets/widgets.dart';

class SellGoldWidget extends StatelessWidget {
  SellGoldWidget({
    super.key,
    required this.image,
    required this.rate,
  });

  final String image;
  final RatesData? rate;

  final TextEditingController gramController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final goldController = Get.find<DigitalGoldController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RateWidget(
            rate: rate,
          ),
          height(10),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.indigo,
              backgroundImage: AssetImage("assets/images/digi.png"),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text(
              "SELLING PRICE",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: SizedBox(
              child: Card(
                  color: Colors.white,
                  shape: const StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Center(
                      child: Text(
                        "24K + 999",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            trailing: Text(
              rate?.rates != null ? "${rate?.rates?.gSell}gm" : "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey.shade700),
            ),
          ),
          height(20),
          ContainerWidget(
            color: Colors.white,
            isPadding: true,
            padding: const EdgeInsets.all(10),
            border: Border.all(width: 0.5, color: Colors.indigo),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Grams",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.indigo),
                      ),
                    ),
                    width(30),
                    Text(
                      "Amount",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.indigo),
                    ),
                    width(0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExchangeWidget(
                      controller: gramController,
                      hintText: "Grams",
                    ),
                    Image.asset(
                      "assets/icons/exchange.png",
                      width: 30,
                      height: 30,
                    ),
                    ExchangeWidget(
                      controller: amountController,
                      hintText: "Amount",
                    ),
                  ],
                ),
              ],
            ),
          ),
          height(30),
          Text(
            "TRANSTER THIS AMOUNT TO BANK",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
          ),
          height(10),
          InkWell(
            onTap: () {},
            child: Card(
                shape: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(
                      10,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_balance,
                        color: Colors.indigo,
                      ),
                      width(20),
                      Text(
                        "Bank Account",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),
          height(20),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  final Map<String, dynamic> json = {
                    "lockPrice": "",
                    "metalType": "gold",
                    "quantity": "",
                    "merchantTransactionId": "",
                    "uniqueId": "",
                    "blockId": "",
                  };

                  await goldController.buyGoldSilverAPI(json);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text(
                  "Sell Now",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          height(20),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "ACCREDITED AND SUPPORTED BY",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  height(10),
                  Image.asset("assets/images/sponsored.jpg"),
                ],
              ),
            ),
          ),
          height(10)
        ],
      ),
    );
  }
}
