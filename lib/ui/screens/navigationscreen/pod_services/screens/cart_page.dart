import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../widgets/widgets.dart';

class PODCartPage extends StatelessWidget {
  const PODCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final podController = Get.find<PODController>();
    podController.fetchPODCartProducts();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: const Text("Cart"),
          centerTitle: true,
          leading: back(),
        ),
        bottomNavigationBar: BottomNavBarWidget(
          controller: podController,
        ),
        body: CartBodyWidget(
          podController: podController,
        ));
  }
}
