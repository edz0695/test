import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/controller/item_controller.dart';
import 'package:payapp/controller/splash_controller.dart';
import 'package:payapp/data/model/response/item_model.dart';
import 'package:payapp/helper/responsive_helper.dart';
import 'package:payapp/helper/route_helper.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/view/base/custom_image.dart';

class ItemImageView extends StatelessWidget {
  final Item? item;
  ItemImageView({super.key, required this.item});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    List<String?> imageList = [];
    imageList.add(item!.image);
    imageList.addAll(item!.images!);

    return GetBuilder<ItemController>(
      builder: (itemController) {
        String? baseUrl = item!.availableDateStarts == null ? Get.find<SplashController>().
            configModel!.baseUrls!.itemImageUrl : Get.find<SplashController>().configModel!.baseUrls!.campaignImageUrl;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                RouteHelper.getItemImagesRoute(item!),
                arguments: ItemImageView(item: item),
              ),
              child: Stack(children: [
                SizedBox(
                  height: ResponsiveHelper.isDesktop(context)? 350: MediaQuery.of(context).size.width * 0.7,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomImage(
                          image: '$baseUrl/${imageList[index]}',
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      itemController.setImageSliderIndex(index);
                    },
                  ),
                ),
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _indicators(context, itemController, imageList),
                    ),
                  ),
                ),

              ]),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _indicators(BuildContext context, ItemController itemController, List<String?> imageList) {
    List<Widget> indicators = [];
    for (int index = 0; index < imageList.length; index++) {
      indicators.add(TabPageSelectorIndicator(
        backgroundColor: index == itemController.imageSliderIndex ? Theme.of(context).primaryColor : Colors.white,
        borderColor: Colors.white,
        size: 10,
      ));
    }
    return indicators;
  }

}
