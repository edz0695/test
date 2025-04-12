import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ParentProvider extends ChangeNotifier {
  bool loadECommerce = false;

  void changeGMAType() {
    loadECommerce = !loadECommerce;
    notifyListeners();
  }

  GetMaterialApp appGMType({
    required GetMaterialApp type1,
    required GetMaterialApp type2,
  }) {
    if (loadECommerce) {
      notifyListeners();
      return type1;
    } else {
      notifyListeners();
      return type2;
    }

  }
}
