import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../src/src.dart';
import 'widgets/widgets.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.index});
  final int index;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  void initState() {
    Get.find<DigitalGoldController>().fetchGoldProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goldController = Get.find<DigitalGoldController>();
    return DefaultTabController(
      initialIndex: widget.index,
      length: 2,
      child: Scaffold(
          backgroundColor: ThemeColors.backgroundLightBlue,
          appBar: AppBar(
            backgroundColor: ThemeColors.backgroundLightBlue,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: ThemeColors.backgroundLightBlue),
            title: const Text(
              'Products',
            ),
            leading: back(),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(() {
                    final cartItems =
                        goldController.goldCartModel.value?.data.items ?? [];
                    return Badge.count(
                      alignment: Alignment.topCenter,
                      count: cartItems.length,
                      backgroundColor: Colors.indigoAccent,
                      child: IconButton(
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.indigo,
                        ),
                        onPressed: () {
                          if (cartItems.isNotEmpty) {
                            Get.to(() => const GoldCartPage());
                          } else {
                            toast(title: "Note", message: "Cart is Empty");
                          }
                        },
                      ),
                    );
                  })),
            ],
            bottom: const TabBar(
                indicatorColor: Colors.indigo,
                indicatorWeight: 3,
                labelColor: Colors.indigo,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                tabs: [
                  Tab(
                    text: 'Gold',
                  ),
                  Tab(text: 'Silver'),
                ]),
          ),
          body: GetBuilder<DigitalGoldController>(
            builder: (controller) {
              return controller.goldProduct.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.indigo,
                        color: Colors.indigoAccent,
                      ),
                    )
                  : TabBarView(
                      children: [
                        GridItemsWidget(
                          image:
                              "https://www.royalmint.com/globalassets/bullion/images/products/bars/rmr/rmgcgkb.png",
                          items: controller.goldProduct
                              .where((i) => i.metalType == "gold")
                              .toList(),
                        ),
                        GridItemsWidget(
                          image:
                              "https://rosabullion.com.au/wp-content/uploads/2023/11/1-kg-silver.png",
                          items: controller.goldProduct
                              .where((i) => i.metalType == "silver")
                              .toList(),
                        ),
                      ],
                    );
            },
          )),
    );
  }
}
