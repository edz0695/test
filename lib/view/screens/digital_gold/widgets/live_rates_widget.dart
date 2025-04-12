import 'package:payapp/src/src.dart';

class LiveRatesWidget extends StatelessWidget {
  const LiveRatesWidget({super.key, required this.rates});

  final RatesData rates;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Rates"),
        centerTitle: true,
        leading: back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            PriceCardWidget(
              rate: rates.rates != null ? "${rates.rates?.gBuy}gm" : "",
              title: "Buy Gold",
              url:
                  "https://uat-augmontgold.s3.ap-south-1.amazonaws.com/products/7/gallery/b5d5c3ddb9bf39fcabaa8cb3213f75b6.png",
            ),
            PriceCardWidget(
              rate: rates.rates != null ? "${rates.rates?.gSell}gm" : "",
              title: "Sell Gold",
              url:
                  "https://uat-augmontgold.s3.ap-south-1.amazonaws.com/products/9/gallery/af0d51d519316d3956888f95348ae391.png",
            ),
            PriceCardWidget(
              rate: rates.rates != null ? "${rates.rates?.sBuy}gm" : "",
              title: "Buy Silver",
              url:
                  "https://uat-augmontgold.s3.ap-south-1.amazonaws.com/products/8/gallery/afb59062d33b8575d2ccdc821810e1a4.png",
            ),
            PriceCardWidget(
              rate: rates.rates != null ? "${rates.rates?.sSell}gm" : "",
              title: "Sell Silver",
              url:
                  "https://uat-augmontgold.s3.ap-south-1.amazonaws.com/products/3/gallery/165156e6542798e47c7aa60664a2927b.png",
            ),
          ],
        ),
      ),
    );
  }
}

class PriceCardWidget extends StatelessWidget {
  const PriceCardWidget({
    super.key,
    required this.rate,
    required this.url,
    required this.title,
  });

  final String url;
  final String title;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          leading: Card(
              shape: const StadiumBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  url,
                ),
              )),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle:
              Text("₹$rate", style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }
}
