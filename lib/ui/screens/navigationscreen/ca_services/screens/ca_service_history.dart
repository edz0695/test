import 'package:get/get.dart';
import 'package:payapp/models/ca_models/ca_history_model.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../src/src.dart';
import 'ca_service_orders_details.dart';

class CaServiceHistory extends StatelessWidget {
  CaServiceHistory({super.key});

  // void seeOrders() {
  //   Timer(const Duration(milliseconds: 600), () {
  //     RouteConfig.navigateTo(context, const OrderSuccessStatus());
  //   });
  // }

  final CAServicesController controller = Get.find<CAServicesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: "History",
          size: 55,
        ),
        body: FutureBuilder<CAHistoryModel?>(
          future: controller.fetchCAOrdersHistory(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading();
            } else if (snapshot.connectionState == ConnectionState.none ||
                snapshot.data == null) {
              return Center(
                child: Text(
                  "Not Available",
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeSmall,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              );
            }
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                itemBuilder: (_, index) {
                  final order = data.data[index];
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                        order.title,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeExtraSmall,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      trailing: Text(
                        order.status == "1" ? "COMPLETED" : "PENDING",
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeOverSmall,
                          color:
                              order.status == "1" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      leading: Card(
                        shape: StadiumBorder(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(order.logo),
                          ),
                        ),
                      ),
                      onTap: () => Get.to(
                          () => CaServiceOrderHistoryDetails(id: order.id)),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: data!.data.length);
          },
        ));
  }
}
