import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../../../../../view/screens/digital_gold/widgets/widgets.dart';

class CartBodyWidget extends StatefulWidget {
  const CartBodyWidget({
    super.key,
    required this.podController,
  });

  final PODController podController;

  @override
  State<CartBodyWidget> createState() => _CartBodyWidgetState();
}

class _CartBodyWidgetState extends State<CartBodyWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final cartItems = widget.podController.podCartModel.value!.data.items;

      return cartItems.isEmpty
          ? Center(
              child: Text(
                "Cart is empty",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cartItems.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                final product = cartItem.product;
                ValueNotifier<int> cartQuantity =
                    ValueNotifier<int>(cartItem.quantity);

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
                        width: 80,
                        height: 120,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            product.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "₹${product.newPrice}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          ValueListenableBuilder(
                            valueListenable: cartQuantity,
                            builder: (context, value, child) => Text(
                              "${product.newPrice} * ${cartQuantity.value} = ${(cartItem.price * cartQuantity.value)}₹",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await widget.podController
                                  .podRemoveFromCartAPI(cartItem.itemId);
                              await widget.podController.fetchPODCartProducts();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          QuantityWidget(
                            isCart: true,
                            isDecrement: true,
                            price: 500,
                            gap: 2,
                            tf: 15,
                            qf: 20,
                            w: 35,
                            decrement: () {
                              if (cartQuantity.value > 1) {
                                cartQuantity.value--;
                                debounceUpdateCartItem(
                                  sizeID: cartItem.size.id,
                                  colorID: cartItem.itemId,
                                  controller: widget.podController,
                                  id: cartItem.itemId.toString(),
                                  quantity: cartQuantity.value,
                                  context: context,
                                );
                              }
                            },
                            quantity: cartQuantity,
                            increment: () {
                              cartQuantity.value++;
                              debounceUpdateCartItem(
                                sizeID: cartItem.size.id,
                                colorID: cartItem.itemId,
                                controller: widget.podController,
                                id: cartItem.itemId,
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
    });
  }

  void debounceUpdateCartItem({
    required String id,
    required String sizeID,
    required String colorID,
    required int quantity,
    required BuildContext context,
    required PODController controller,
  }) {
    _debounce?.cancel(); // Cancel any existing debounce
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
