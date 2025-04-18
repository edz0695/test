import 'package:payapp/controller/item_controller.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/view/base/custom_app_bar.dart';
import 'package:payapp/view/base/footer_view.dart';
import 'package:payapp/view/base/item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/view/base/menu_drawer.dart';

class PopularItemScreen extends StatefulWidget {
  final bool isPopular;
  const PopularItemScreen({super.key, required this.isPopular});

  @override
  State<PopularItemScreen> createState() => _PopularItemScreenState();
}

class _PopularItemScreenState extends State<PopularItemScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    if(widget.isPopular) {
      Get.find<ItemController>().getPopularItemList(true, Get.find<ItemController>().popularType, false);
    }else {
      Get.find<ItemController>().getReviewedItemList(true, Get.find<ItemController>().reviewType, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      builder: (itemController) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: CustomAppBar(
            key: scaffoldKey,
            title: widget.isPopular ? 'popular_items_nearby'.tr : 'best_reviewed_item'.tr, showCart: true,
            type: widget.isPopular ? itemController.popularType : itemController.reviewType,
            onVegFilterTap: (String type) {
              if(widget.isPopular) {
                itemController.getPopularItemList(true, type, true);
              }else {
                itemController.getReviewedItemList(true, type, true);
              }
            },
          ),
          endDrawer: const MenuDrawer(),endDrawerEnableOpenDragGesture: false,
          body: Scrollbar(child: SingleChildScrollView(child: FooterView(child: SizedBox(
            width: Dimensions.webMaxWidth,
            child: ItemsView(
              isStore: false, stores: null,
              items: widget.isPopular ? itemController.popularItemList : itemController.reviewedItemList,
            ),
          )))),
        );
      }
    );
  }
}
