import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/service_details_form.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import '../../../../../src/src.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final String id;
  final String title, price;

  const ServiceDetailsScreen(
      {super.key, required this.id, required this.title, required this.price});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CAServicesController>().fetchCAServices(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final caController = Get.find<CAServicesController>();

    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        size: 55,
      ),
      body: Obx(() {
        if (caController.cAServicesModel.value == null) {
          return loading();
        } else {
          final data = caController.cAServicesModel.value?.data;

          final String benefitsHtml = '''
      <ul>
        ${data!.benefits.map((item) => '<li>$item</li>').join('')}
      </ul>
    ''';

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: data.banners.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final banner = data.banners[itemIndex];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.topRight,
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(banner.toString()))),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 170,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.99,
                  ),
                ),
                height(20),
                Card(
                  child: ListTile(
                    subtitle: Column(
                      children: [
                        HtmlWidget(
                          benefitsHtml,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        onPressed: () {
          Get.to(() => ServiceDetailsForm(
                title: widget.title,
                id: widget.id,
                price: widget.price,
              ));

          // RouteConfig.navigateToRTL(
          //     context,
          //     RequiredDocsScreen(
          //       screenTitle: widget.title,
          //     ));
        },
        label: const Text(
          '      Continue To Payment      ',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
