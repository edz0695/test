import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../widgets/widgets.dart';

class GoldCartPage extends StatelessWidget {
  const GoldCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final goldController = Get.find<DigitalGoldController>();
    goldController.fetchGoldCartProducts();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.backgroundLightBlue,
          title: const Text("Cart"),
          centerTitle: true,
          leading: back(),
        ),
        bottomNavigationBar: BottomNavBarWidget(
          controller: goldController,
        ),
        body: CartBodyWidget(
          goldController: goldController,
        ));
  }
}
