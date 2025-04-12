import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../src/src.dart';
import 'widgets/widgets.dart';

class DigitalGold extends StatefulWidget {
  const DigitalGold({super.key});

  @override
  State<DigitalGold> createState() => _DigitalGoldState();
}

class _DigitalGoldState extends State<DigitalGold> {
  List<String> gramList = ["100", "200", "500", "1000"];
  @override
  void initState() {
    Get.find<DigitalGoldController>().fetchRates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DigitalGoldController controller = Get.find<DigitalGoldController>();
    return Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ThemeColors.backgroundLightBlue,
          ),
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: Image.asset(
            // 'assets/images/logo.jpg',
            "assets/images/digiGold.png",
            width: 110,
          ),
          leading: back(),
          leadingWidth: 30,
          actions: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.lightBlue,
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.indigo,
              ),
              onTap: () {},
            ),
            width(10),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.lightBlue,
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.indigo,
                size: 27,
              ),
              onTap: () {},
            ),
            width(10),
          ],
        ),
        body: Obx(() {
          final rates = controller.ratesResponse.value?.result?.data;
          return Column(
            children: [
              SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 110,
                          child: TextButton(
                            onPressed: () =>
                                Get.to(() => LiveRatesWidget(rates: rates!)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Live Rate",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: darkRedColor),
                                ),
                                width(5),
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: darkRedColor,
                                        shape: BoxShape.circle))
                              ],
                            ),
                          ),
                        ),
                      ),
                      height(10),
                      RateWidget(rate: rates),
                      height(20),
                      Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () async =>
                                    Get.to(() => const CartWidget(index: 0)),
                                child: GradientWidget(
                                  title: "Gold",
                                  desc: "24K | 999",
                                  price: rates?.rates != null
                                      ? "${rates?.rates?.gBuy}gm"
                                      : "",
                                ),
                              ),
                              height(5),
                              const PercentWidget(
                                percent: "2.76",
                              )
                            ],
                          ),
                          width(20),
                          Column(
                            children: [
                              InkWell(
                                onTap: () async =>
                                    Get.to(() => const CartWidget(
                                          index: 1,
                                        )),
                                child: GradientWidget(
                                  title: "Silver",
                                  desc: "24K | 999",
                                  price: rates?.rates != null
                                      ? "${rates?.rates?.sBuy}gm"
                                      : "",
                                ),
                              ),
                              height(5),
                              const PercentWidget(
                                percent: "7.80",
                              )
                            ],
                          ),
                        ],
                      ),
                      height(20),
                      JwelleryTypesWidget(
                        types: types,
                        rate: rates,
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
                                Text(
                                  "Best Gold Buy Option",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.indigo,
                                          fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 185,
                                  height: 25,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: gramList.length,
                                    itemBuilder: (context, index) {
                                      final gram = gramList[index];
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: InkWell(
                                            onTap: () => setState(() =>
                                                controller.getGoldGram(
                                                    gram: gram,
                                                    currentIndex: index)),
                                            child: ContainerWidget(
                                                alignment: Alignment.center,
                                                width: 40,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: controller
                                                            .getIndex.value ==
                                                        index
                                                    ? Colors.indigo
                                                    : Colors.blueGrey.shade700,
                                                colorsList: [
                                                  Colors.blueGrey.shade700,
                                                  Colors.blueGrey.shade700
                                                ],
                                                child: Text(
                                                  gram,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                )),
                                          ));
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(100, 40),
                                        backgroundColor: Colors.indigo),
                                    onPressed: () async =>
                                        Get.to(() => GoldWidget(
                                              rate: rates!,
                                              gram: controller.getGram.value,
                                            )),
                                    child: Text(
                                      "Buy More",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 11),
                                    ))
                              ],
                            ),
                            height(10),
                            Text(
                              "Free Storage* | Free PAN India Delivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.indigo, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      height(20),
                    ],
                  )),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 30,
                color: Colors.indigo,
                child: Text(
                  "5 people bought 1gm gold in last hour",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          );
        }));
  }
}
