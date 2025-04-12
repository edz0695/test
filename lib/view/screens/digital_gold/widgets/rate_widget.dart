import '../../../../src/src.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
  });

  final RatesData? rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "You Own",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            const Text("24K | 999"),
          ],
        ),
        const SizedBox(
          height: 30,
          child: VerticalDivider(),
        ),
        Container(
            width: 35,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo,
              image: DecorationImage(
                image: AssetImage("assets/images/digi.png"),
              ),
            )),
        width(7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DigiGold",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            Text(rate?.rates != null ? "${rate?.rates?.gBuy}gm" : ""),
          ],
        ),
        width(7),
        Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigoAccent,
              image: DecorationImage(
                image: AssetImage("assets/images/digi.png"),
              ),
            )),
        width(5),
        Column(
          children: [
            Text(
              "DigiSilver",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            Text(rate?.rates != null ? "${rate?.rates?.sBuy}gm" : ""),
          ],
        )
      ],
    );
  }
}
