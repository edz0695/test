import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payapp/config/hiveConfig.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/core/nativemethods/androidnativemethods.dart';
import 'package:payapp/models/contacts_model.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:permission_handler/permission_handler.dart';
import '../core/services/hiveDatabase.dart';
import '../models/CircleWisePlanLists.dart';
import '../models/CircleWisePlanListsModel.dart';
import '../models/bill_model.dart';
import '../models/operatormodel.dart';
import '../models/rechargeservicesmodels/dth/dthoperatormodel.dart';
import '../models/rechargeservicesmodels/mobile/plansmodel.dart';

class RechargeServicesProvider extends ChangeNotifier{
  List<ContactsModel> contacts = [];
  PermissionStatus? result;
  PlansModel? plansModel;
  List<String> planCategories = [];
  List<DthOperatorModel> dthOperators = [];
  List<CircleWisePlanLists>? circleWisePlanLists;

  Box? box;

  //For All
  List<OperatorModel> operators = [];

  bool loading = false;

  RechargeServicesProvider(){
   requestContactsPermission();
  }

  Future<bool> requestContactsPermission() async {

    // In Android we need to request the storage permission,
    // while in iOS is the photos permission
    if (Platform.isAndroid) {
      result = await Permission.contacts.request();
    }

    if (result!.isGranted) {

      getContacts();
      return true;
    }
    else if (result!.isPermanentlyDenied) {
      printThis("Permanently Denied");
    }
    else {
      printThis("Temp Denied");
    }
    notifyListeners();
    return false;
  }

  Future<List> getContacts() async {
    List contactsTemp = await NativeMethods.getContacts();
    contacts = contactsTemp.map((e) =>ContactsModel.fromMap(e) ).toList();
    contacts.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
    notifyListeners();
    printThis(contacts.length);
    printThis(contactsTemp.length);
    return contacts;
  }


  Future getMobileRechargePlans({required String mobileNumber}) async {
    plansModel = await ApiService.fetchMobileRechargePlans(mobileNumber: mobileNumber);
    for(var element in plansModel!.plans){
      if(!planCategories.contains(element.planType)){
        planCategories.add(element.planType);
      }
    }
    notifyListeners();
  }

  Future<List<CircleWisePlanLists>?> getCircleData({required String mobileNumber}) async {
    try{
      CircleWisePlanListsModel model = await ApiService.fetchCircleWisePlanLists(data: {
        "mobileNo":mobileNumber
      });
      circleWisePlanLists= model.payload?.first.circleWisePlanLists??[];
      print(circleWisePlanLists?.first.plansInfo?.length);
    }
    catch(e){
    }

    notifyListeners();
    return circleWisePlanLists;
  }



  // Future<List<DthOperatorModel>> getDthOperators() async {
  //   dthOperators = await ApiService.fetchDthOperators();
  //   loading = false;
  //   notifyListeners();
  //   return dthOperators;
  // }




  Future<List<OperatorModel>> getOperators({required String serviceType}) async {
    if(box!=null){
      final value = await ApiService.fetchOperators(serviceType:serviceType)
          .then((value) async {
        await box!.clear();
        await HiveDataBase.saveSingleItem(
            box: box!, data: value, key: serviceType);
        final operatorsList = (value??[]) as List;
        operators = operatorsList.map((e) => OperatorModel.fromMap(e)).toList();
        operators.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
        return operators;
      }).onError((error, stackTrace) async{
        final model =
        (await HiveDataBase.getSingleItem(key: serviceType, box: box!)??[]) as List;
        operators = model.map((e) => OperatorModel.fromMap(e)).toList();
        operators.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
        return operators;
      });
      await box!.close();
      notifyListeners();
      return value;
    }
    else{
      box = await HiveDataBase.openBox(boxName: HiveConfig.operators);
      await getOperators(serviceType: serviceType);
      return operators;
    }
  }

  Future<List<OperatorModel>> getBillerAllDetailsByCategoryName({required String serviceType}) async {

      final value = await ApiService.fetchAllBillerCategories(serviceType:serviceType.toUpperCase())
          .then((value) async {

        final operatorsList = (value??[]) as List;
        operators = operatorsList.map((e) => OperatorModel.fromMap(e)).toList();
        operators.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
        return operators;
      });
      notifyListeners();
      return operators;
    }

  Future<BillModel?> getBill({required var data})async {
    final bill = await ApiService.fetchBill(data: data);
    return bill;
  }
}