import 'package:get/get.dart';

import '../../../../../src/src.dart';
import 'widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
  });
  final String title;
  final String desc;
  final String image;
  final String price;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ValueNotifier<int> quantity = ValueNotifier<int>(1);
  final goldController = Get.find<DigitalGoldController>();

  String generateRandomId() => DateTime.now().millisecondsSinceEpoch.toString();

  @override
  void initState() {
    goldController.fetchGoldCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    goldController.fetchGoldCartProducts();

    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                QuantityWidget(
                    quantity: quantity,
                    increment: () {
                      quantity.value++;
                    },
                    decrement: () =>
                        quantity.value > 1 ? quantity.value-- : null,
                    w: 50,
                    qf: 20,
                    tf: 15,
                    gap: 10,
                    price: double.parse(widget.price)),
                Obx(() {
                  final cartItems =
                      goldController.goldCartModel.value?.data.items ?? [];
                  return ActionChip.elevated(
                    tooltip: "Add To Cart",
                    label: const Text("Add To Cart"),
                    onPressed: () {
                      final Map<String, String> json = {
                        "productId": generateRandomId().toString(),
                        "name": widget.title,
                        "image": widget.image,
                        "quantity": quantity.value.toString(),
                        "price": widget.price
                      };
                      if (cartItems.any((i) => i.name == widget.title)) {
                        toast(
                            title: "Note",
                            message: "Item already exists in cart");
                      } else {
                        goldController.goldAddToCartAPI(json);
                      }
                    },
                    shape: const StadiumBorder(),
                  );
                })
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: const Text("Details"),
          centerTitle: true,
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
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                    tag: widget.image,
                    child: Card(
                      shape: const StadiumBorder(),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.indigo,
                        backgroundImage: NetworkImage(
                          widget.image,
                        ),
                      ),
                    )),
              ),
              height(20),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              height(10),
              Text(
                widget.desc,
                textAlign: TextAlign.justify,
              ),
              height(10),
              Text(
                "Price",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
              ),
              Text(
                "₹${widget.price}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              height(10),
            ],
          ),
        ));
  }
}
