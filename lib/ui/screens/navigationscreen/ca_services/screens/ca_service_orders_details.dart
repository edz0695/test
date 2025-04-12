import 'package:get/get.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../src/src.dart';
import 'all_order_details.dart';

class CaServiceOrderHistoryDetails extends StatelessWidget {
  CaServiceOrderHistoryDetails({super.key, required this.id});
  final String id;

  final CAServicesController controller = Get.find<CAServicesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: "Order Details",
          size: 55,
        ),
        body: FutureBuilder<CAOrderDetailsModel?>(
          future: controller.fetchCAOrdersHistoryDetails(id),
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
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                    shape: StadiumBorder(),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(data!.logo),
                      ),
                    ),
                  ),
                  height(20),
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeDefault,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  height(20),
                  Divider(
                    color: Colors.grey,
                  ),
                  height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "See Form Details",
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => AllOrdersDetails(
                              formDetails: data.formDetails,
                            )),
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
