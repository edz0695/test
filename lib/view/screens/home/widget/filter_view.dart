import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payapp/controller/store_controller.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/util/styles.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (storeController) {
      return storeController.storeModel != null ? PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: 'all', textStyle: robotoMedium.copyWith(
              color: storeController.storeType == 'all'
                  ? Theme.of(context).textTheme.bodyLarge!.color : Theme.of(context).disabledColor,
            ), child: Text('all'.tr)),
            PopupMenuItem(value: 'take_away', textStyle: robotoMedium.copyWith(
              color: storeController.storeType == 'take_away'
                  ? Theme.of(context).textTheme.bodyLarge!.color : Theme.of(context).disabledColor,
            ), child: Text('take_away'.tr)),
            PopupMenuItem(value: 'delivery', textStyle: robotoMedium.copyWith(
              color: storeController.storeType == 'delivery'
                  ? Theme.of(context).textTheme.bodyLarge!.color : Theme.of(context).disabledColor,
            ), child: Text('delivery'.tr)),
          ];
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: Icon(Icons.filter_list),
        ),
        onSelected: (dynamic value) => storeController.setStoreType(value),
      ) : const SizedBox();
    });
  }
}
