import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/models/earnbanksmodel.dart';
import 'package:payapp/models/earncategorymodel.dart';
import 'package:payapp/services/apis/apiservice.dart';
import '../config/hiveConfig.dart';
import '../core/services/hiveDatabase.dart';
import '../models/earnOfferDetailsModel.dart';
import '../models/earnoffermodel.dart';

class ScholorshipProvider extends ChangeNotifier {
  EarnMainModel? earnMainModel;
  List<EarnBanksModel> activeBanks = [];
  OffersModel? offers;
  EarnOfferDetailsModel? offer;

  //loading variables
  bool isLoadingOffer = false;
  final List formFields = [];

  EarnScreenProvider() {
    getActiveCategories();
    getActiveOffers();
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

  Future<OffersModel?> getActiveOffers() async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.activeOffers);
    final value =
        await ApiService.fetchActiveOffers(id_endporin: "").then((value) async {
      await box.clear();
      await HiveDataBase.saveSingleItem(
          box: box, data: value, key: HiveConfig.activeOffers);
      offers = OffersModel.fromMap(value);
      return offers;
    }).onError((error, stackTrace) async {
      final model = await HiveDataBase.getSingleItem(
          key: HiveConfig.activeOffers, box: box);
      offers = OffersModel.fromMap(model);
      return offers;
    });
    await box.close();
    notifyListeners();
    return value;
  }

  Future getOfferDetails(String id) async {
    formFields.clear();
    offer = null;
    printThis(id);

    final tempOffer = await ApiService.fetchOffersDetails(id);
    offer = EarnOfferDetailsModel.fromMap(tempOffer);
    // if(offer!=null){
    // for(var element in offer!.formParameters){
    //   if(element.inputType=="file"){
    //     formFields.add(ImagePickerWidget(
    //       label: element.label,
    //
    //     ));
    //   }
    //   else if(element.type == "date"){
    //     formFields.add(DatePickerWidget(
    //       label: element.label,
    //
    //     ));
    //   }
    //   else{
    //     formFields.add(FormFieldWidget(
    //       title: element.label,
    //       editingController: TextEditingController(),
    //       validator: (value)=>FormValidator.validateMobile(value),validationType: element.validation,
    //     )
    //     );
    //   }
    //
    // }
    // }
    notifyListeners();
  }
}
