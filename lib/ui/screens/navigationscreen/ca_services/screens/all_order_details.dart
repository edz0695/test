import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../src/src.dart';

class AllOrdersDetails extends StatelessWidget {
  const AllOrdersDetails({super.key, required this.formDetails});
  final List<FormDetail> formDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Form Details",
        size: 55,
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (_, index) {
            final order = formDetails[index];
            return Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Card(
                    shape: StadiumBorder(),
                    child: Text(
                      "${index + 1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                height(10),
                Card(color: Colors.white, child: Image.network(order.value)),
              ],
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: formDetails.length),
    );
  }
}
