import 'package:get/get.dart';

import '../../../../src/src.dart';
import 'widgets.dart';

class JwelleryTypesWidget extends StatelessWidget {
  const JwelleryTypesWidget({
    super.key,
    required this.types,
    required this.rate,
  });

  final List<GoldTypeModel> types;
  final RatesData? rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: types
          .map(
            (i) => SizedBox(
              width: 110,
              height: 100,
              child: Card(
                  color: Colors.white,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size(120, 100),
                        padding: const EdgeInsets.all(0),
                        overlayColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      if (i.title == "BUY Gold") {
                        Get.to(() => GoldWidget(rate: rate!));
                      } else if (i.title == "BUY Silver") {
                        Get.to(() => SilverWidget(rate: rate!));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      child: Column(
                        children: [
                          Image.asset(
                            i.image,
                            width: 100,
                            height: 50,
                          ),
                          Text(
                            i.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w100, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          )
          .toList(),
    );
  }
}
