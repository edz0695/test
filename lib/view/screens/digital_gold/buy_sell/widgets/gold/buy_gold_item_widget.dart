import 'package:get/get.dart';
import '../../../../../../src/src.dart';
import '../../../widgets/widgets.dart';

class BuyGoldWidget extends StatelessWidget {
  const BuyGoldWidget({
    super.key,
    required this.rate,
    required this.controller,
    required this.amountController,
  });
  final RatesData rate;
  final TextEditingController controller;
  final TextEditingController amountController;

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
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.indigo,
              backgroundImage: AssetImage("assets/images/digi.png"),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text(
              "BUYING PRICE",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Card(
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
            trailing: SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    rate.rates != null ? "${rate.rates?.gBuy}gm" : "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey.shade700),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/triangle.png",
                        width: 10,
                        height: 10,
                        color: Colors.green,
                      ),
                      width(5),
                      Text(
                        "2.76% since yesterday",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          height(20),
          ContainerWidget(
            color: Colors.white,
            isPadding: true,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Grams",
                          style: Theme.of(context).textTheme.titleMedium!),
                    ),
                    width(30),
                    Text("Amount",
                        style: Theme.of(context).textTheme.titleMedium!),
                    width(0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExchangeWidget(
                        controller: controller,
                        hintText: "Grams",
                        onChanged: (gram) {
                          amountController.text =
                              (double.parse(rate.rates!.gBuy.toString()) *
                                      int.parse(gram.toString()))
                                  .toString();
                        }),
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
                  "Buy Now",
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
