import 'dart:async';
import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../../../../../view/screens/digital_gold/widgets/widgets.dart';
import '../../../../../widgets/payment_widget.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({
    super.key,
  });

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final podController = Get.find<DigitalGoldController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.backgroundLightBlue,
        title: const Text("Check out"),
        centerTitle: true,
        leading: back(),
      ),
      bottomNavigationBar: Obx(
        () {
          final cartData = podController.goldCartModel.value?.data;
          final totalPrice = cartData?.totalPrice ?? 0;

          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.indigo,
                                ),
                      ),
                      Text(
                        "₹$totalPrice",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.indigoAccent,
                                ),
                      ),
                    ],
                  ),
                  width(10),
                  ActionChip.elevated(
                    tooltip: "Place an order",
                    label: Row(
                      children: [
                        const Text("Place an order"),
                        width(5),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.indigoAccent.shade100,
                            shape: const StadiumBorder(),
                            child: Center(
                              child: Text(
                                (cartData?.items.length ?? 0).toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async => await Get.to(() => PaymentWidget(
                          cartItems: const [],
                          price: "₹$totalPrice",
                        )),
                    shape: const StadiumBorder(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: Obx(
        () {
          final cartItems = podController.goldCartModel.value?.data.items ?? [];
          if (cartItems.isEmpty) {
            return Center(
              child: Text(
                "Products not available",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cartItems.length,
            padding: const EdgeInsets.only(bottom: 20),
            itemBuilder: (context, index) {
              var product = cartItems[index];
              ValueNotifier<int> cartQuantity =
                  ValueNotifier<int>(product.quantity);

              return ContainerWidget(
                color: Colors.white,
                isMargin: true,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                isPadding: true,
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                        shape: const StadiumBorder(),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.indigo,
                          backgroundImage:
                              NetworkImage(product.image.toString()),
                        )),
                    width(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(10),
                          Text(
                            product.name,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                          ),
                          height(5),
                          Text(
                            "₹${(product.price)}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigoAccent,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async =>
                              podController.goldRemoveFromCartAPI(product.id),
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                        QuantityWidget(
                          isCart: true,
                          price: double.parse(product.price.toString()),
                          gap: 2,
                          tf: 15,
                          qf: 20,
                          w: 35,
                          decrement: () {},
                          quantity: cartQuantity,
                          increment: () {
                            cartQuantity.value++;
                            debounceUpdateCartItem(
                              controller: podController,
                              id: product.id.toString(),
                              quantity: cartQuantity.value,
                              context: context,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void debounceUpdateCartItem({
    required String id,
    required int quantity,
    required BuildContext context,
    required DigitalGoldController controller,
  }) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (context.mounted) {
        final Map<String, String> json = {
          "quantity": quantity.toString(),
        };
        controller.goldUpdateCartAPI(body: json, id: id);
      }
    });
  }
}
