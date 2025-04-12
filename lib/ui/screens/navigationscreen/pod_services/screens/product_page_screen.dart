
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:payapp/controller/controllers.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/helper/constants.dart';
import 'package:payapp/ui/dialogs/loaderdialog.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  final Mug productModel;

  const ProductScreen({super.key, required this.productModel});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;
  String size = 'Small';
  Color selectedColor = Colors.transparent;

  final podController = Get.find<PODController>();

  @override
  void initState() {
    podController.fetchPODCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    podController.fetchPODProducts(widget.productModel.productId);
    return Scaffold(
        appBar: AppBarWidget(
          title: 'Product Details',
          size: 50,
          actions: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() {
                  final cartItems =
                      podController.podCartModel.value?.data.items ?? [];
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
                          Get.to(() => const PODCartPage());
                        } else {
                          toast(title: "Note", message: "Cart is Empty");
                        }
                      },
                    ),
                  );
                })),
          ],
        ),
        body: Obx(() {
          if (podController.podModel.value == null) {
            return loading();
          } else {
            var product = podController.podModel.value!.data;
            final cartItems =
                podController.podCartModel.value?.data.items ?? [];

            // podController.getCacheImage();
            final discount = (((double.parse(product.oldPrice) -
                            double.parse(podController.size.value == ''
                                ? product.newPrice
                                : product.size!
                                    .where((i) =>
                                        i.size.name == podController.size.value)
                                    .map((i) => i.price)
                                    .first)) /
                        double.parse(product.oldPrice)) *
                    100)
                .toStringAsFixed(0);

            final price = product.size!
                    .any((i) => i.size.name == podController.size.value)
                ? product.size!
                    .where((i) => i.size.name == podController.size.value)
                    .map((i) => i.price)
                    .first
                : '₹${product.newPrice}';

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider.builder(
                    itemCount: product.size!
                            .any((i) => i.size.name == podController.size.value)
                        ? product.size!
                            .where(
                                (i) => i.size.name == podController.size.value)
                            .map((i) => i.media)
                            .length
                        : product.images!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      final image = product.size!.any(
                              (i) => i.size.name == podController.size.value)
                          ? product.size!
                              .where((i) =>
                                  i.size.name == podController.size.value)
                              .map((i) => i.media![itemIndex])
                              .first
                          : product.images![itemIndex];

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            alignment: Alignment.topRight,
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(image.toString()))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                color: Colors.indigo,
                                shape: const StadiumBorder(),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () => Get.to(() => ImageEditScreen(
                                            baseImageUrl: image.toString(),
                                          )),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ),
                            )),
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.99,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Text("Sizes : ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: product.size!
                                .map(
                                  (i) => _buildSizeOption(
                                      press: (p0) {
                                        podController
                                            .getSelectedSizeID(i.size.id);
                                        podController
                                            .getSelectedSize(i.size.name);
                                      },
                                      size: i.size.name.toString()),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text("Colors : ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: product.colors!.map((i) {
                              final int color = int.parse(
                                  "0xff${i.colorCode.replaceAll('#', '')}");
                              return _buildColorOption(
                                  press: () => setState(() {
                                        selectedColor = Color(color);
                                        podController.getSelectedColorID(i.id);
                                      }),
                                  color: Color(color));
                            }).toList(),
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '₹${product.oldPrice}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                decorationColor: Colors.red),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$discount % OFF',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      height(15),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Card(
                                    shape: const StadiumBorder(),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          overlayColor: Colors.indigo,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )),
                                      onPressed: () {
                                        if (quantity > 1) {
                                          setState(() => quantity--);
                                        }
                                      },
                                      child: Text(
                                        "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    )),
                              ),
                              width(10),
                              Text(
                                quantity.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                              width(10),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Card(
                                    shape: const StadiumBorder(),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          overlayColor: Colors.indigo,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          )),
                                      onPressed: () =>
                                          setState(() => quantity++),
                                      child: Text(
                                        "+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.indigo,
                            ),
                            onPressed: () async {
                              if (podController.sizeID.value.isNotEmpty &&
                                  podController.colorID.value.isNotEmpty) {
                                podController.podAddToCartAPI(
                                    id: widget.productModel.productId,
                                    qty: quantity);
                              } else {
                                toast(
                                    title: "Note",
                                    message: "Size and Color are required");
                              }
                            },
                            child: const Text('Add To Cart'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      height(10),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.indigo,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.delivery_dining_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Estimated Delivery By : "),
                          Text("3 May - 6 May",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      height(10),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      height(10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OfferWidget(
                            icon: Icons.money,
                            title: "10+",
                            subtitle: "Cashback",
                          ),
                          OfferWidget(
                            icon: Icons.person_add_alt_rounded,
                            title: "1M+",
                            subtitle: "Customers",
                          ),
                          OfferWidget(
                            icon: Icons.inventory,
                            title: "7 days",
                            subtitle: "Replacement",
                          ),
                          OfferWidget(
                            icon: Icons.info,
                            title: "help",
                            subtitle: "Contact us",
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }
        }));
  }

  Widget _buildSizeOption(
      {required String size, required Function(dynamic) press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ChoiceChip(
        label: Text(size),
        selected: this.size == size,
        selectedColor: Colors.indigo,
        labelStyle:
            TextStyle(color: this.size == size ? Colors.white : Colors.black),
        onSelected: (selected) {
          setState(() {
            this.size = size;
          });
          press(selected);
        },
      ),
    );
  }

  Widget _buildColorOption({required Color color, required Function() press}) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selectedColor == color ? Colors.indigo : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.indigo,
            radius: 25,
            child: Icon(icon),
          ),
          height(5),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
