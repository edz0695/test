import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../../../../../widgets/payment_widget.dart';
import '../../../../../view/screens/digital_gold/widgets/widgets.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({super.key});
  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final podController = Get.find<PODController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.backgroundLightBlue,
        title: const Text("Check Out"),
        centerTitle: true,
        leading: back(),
      ),
      bottomNavigationBar: Obx(
        () {
          final cartData = podController.podCartModel.value?.data;
          final totalPrice = cartData?.totalPrice ?? 0;

          cartData!.items.first.color.id;
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
                                (cartData.items.length ?? 0).toString(),
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
                          cartItems: cartData.items,
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
          final cartItems = podController.podCartModel.value?.data.items ?? [];
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
              var cartItem = cartItems[index];
              ValueNotifier<int> cartQuantity =
                  ValueNotifier<int>(cartItem.quantity);
              var product = cartItem.product;

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
                    CachedNetworkImage(
                      imageUrl: cartItem.image.toString(),
                      width: 50,
                      height: 100,
                    ),
                    width(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(10),
                          Text(
                            product.title,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          height(5),
                          Text(
                            "₹${(cartItem.product.newPrice)}",
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
                          onPressed: () async => podController
                              .podRemoveFromCartAPI(cartItem.itemId),
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                        QuantityWidget(
                          isCart: true,
                          price: double.parse(product.newPrice),
                          gap: 2,
                          tf: 15,
                          qf: 20,
                          w: 35,
                          decrement: () {},
                          quantity: cartQuantity,
                          increment: () {
                            cartQuantity.value++;
                            debounceUpdateCartItem(
                              sizeID: cartItem.size.id,
                              colorID: cartItem.itemId,
                              controller: podController,
                              id: cartItem.itemId.toString(),
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
    required String sizeID,
    required String colorID,
    required int quantity,
    required BuildContext context,
    required PODController controller,
  }) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (context.mounted) {
        final Map<String, String> json = {
          "quantity": quantity.toString(),
        };
        controller.podUpdateCartAPI(body: json, id: id);
      }
    });
  }
}
