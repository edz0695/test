import 'package:get/get.dart';

import '../../../../../src/src.dart';
import 'widgets.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.controller,
  });
  final PODController controller;
  @override
  Widget build(BuildContext context) {
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
                  Text("Grand Total",
                      style: Theme.of(context).textTheme.titleMedium),
                  Obx(
                    () => Text(
                      controller.podCartModel.value != null
                          ? "${controller.podCartModel.value!.data.totalPrice}₹"
                          : "0₹",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  )
                ]),
            width(10),
            ActionChip.elevated(
              tooltip: "Check Out",
              avatar: const Icon(
                Icons.shopping_basket,
                color: Colors.indigo,
              ),
              label: Row(
                children: [
                  const Text("Checkout"),
                  width(5),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Card(
                      color: Colors.indigoAccent.shade100,
                      shape: const StadiumBorder(),
                      child: Center(
                          child: Obx(
                        () => Text(
                          (controller.podCartModel.value?.data.items.length ??
                                  0)
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      )),
                    ),
                  )
                ],
              ),
              onPressed: () => Get.to(() => const CheckOutWidget()),
              shape: const StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
