import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/models/earnbanksmodel.dart';
import 'package:payapp/models/earncategorymodel.dart';
import 'package:payapp/services/apis/apiservice.dart';
import '../../config/hiveConfig.dart';
import '../../core/services/hiveDatabase.dart';
import '../../models/earnOfferDetailsModel.dart';
import '../../models/earnoffermodel.dart';

class EarnScreenProvider extends ChangeNotifier {
  EarnMainModel? earnMainModel;
  List<EarnBanksModel> activeBanks = [];
  OffersModel? offers;
  OffersModel? offersForAll;
  EarnOfferDetailsModel? offer;
  bool isLoadingOffer = false;
  final List formFields = [];
  int currentIndex = 0;

  void updateIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  EarnScreenProvider() {
    getActiveCategories();
    // getActiveOffers(id: " ");
    getActiveOffersforAllCata();
  }

  Future<EarnMainModel?> getActiveCategories() async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.activeCategories);
    final value = await ApiService.fetchActiveCategories().then((value) async {
      await box.clear();
      await HiveDataBase.saveSingleItem(
          box: box, data: value, key: HiveConfig.activeCategories);
      earnMainModel = EarnMainModel.fromMap(value);
      return earnMainModel;
    }).onError((error, stackTrace) async {
      final model = await HiveDataBase.getSingleItem(
          key: HiveConfig.activeCategories, box: box);
      earnMainModel = EarnMainModel.fromMap(model);
      return earnMainModel;
    });
    await box.close();
    notifyListeners();
    return value;
  }

  Future<OffersModel?> getActiveOffers({required String id}) async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.activeOffers);
    final value =
        await ApiService.fetchActiveOffers(id_endporin: id).then((value) async {
      print(
          "the data offer is --------------------------------------------------------");
      print(value);
      await box.clear();
      await HiveDataBase.saveSingleItem(
          box: box, data: value, key: HiveConfig.activeOffers);
      offers = OffersModel.fromMap(value);
      return offers;
    }).onError((error, stackTrace) async {
      final model = await HiveDataBase.getSingleItem(
          key: HiveConfig.activeOffers, box: box);
      offers = OffersModel.fromMap(model);
      print("We have gotten all active offers succcessfully");
      return offers;
    });
    await box.close();
    notifyListeners();
    return value;
  }

  Future<OffersModel?> getActiveOffersforAllCata() async {
    try {
      Box box =
          await HiveDataBase.openBox(boxName: HiveConfig.activeOffers_forAll);
      final value =
          await ApiService.fetchActiveOffersfor_all_cata().then((value) async {
        printThis("get all offers here : ");
        printThis(value);
        await box.clear();
        await HiveDataBase.saveSingleItem(
            box: box, data: value, key: HiveConfig.activeOffers_forAll);
        offersForAll = OffersModel.fromMap(value);
        return offersForAll;
      }).onError((error, stackTrace) async {
        final model = await HiveDataBase.getSingleItem(
            key: HiveConfig.activeOffers_forAll, box: box);
        offersForAll = OffersModel.fromMap(model);
        printThis("Offers");
        printThis(offersForAll);
        return offersForAll;
      });
      await box.close();
      notifyListeners();
      return value;
    } catch (e) {
      printThis("Something went wrong in GetOffers $e");
    }
    return null;
  }

  Future getOfferDetails(String id) async {
    try {
      formFields.clear();
      offer = null;
      printThis("Earning ID $id");
      final tempOffer = await ApiService.fetchOffersDetails(id);
      printThis('Earning body $tempOffer');

      offer = EarnOfferDetailsModel.fromMap(tempOffer);
      // if (offer != null) {
      //   for (var element in offer) {
      //     if (element.inputType == "file") {
      //       formFields.add(ImagePickerWidget(
      //         label: element.label,
      //       ));
      //     } else if (element.type == "date") {
      //       formFields.add(DatePickerWidget(
      //         label: element.label,
      //       ));
      //     } else {
      //       formFields.add(FormFieldWidget(
      //         title: element.label,
      //         editingController: TextEditingController(),
      //         validator: (value) => FormValidator.validateMobile(value),
      //         validationType: element.validation,
      //       ));
      //     }
      //   }
      // }
    } catch (e) {
      printThis("Something went wrong $e");
    }
    notifyListeners();
  }
}
