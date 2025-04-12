import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payapp/models/account_manager_model.dart';

import '../config/hiveConfig.dart';
import '../core/services/hiveDatabase.dart';
import '../services/apis/apiservice.dart';

class AccountManagerProvider extends ChangeNotifier {
  AccountManagerModel? accountManagerModel;

  Future<AccountManagerModel?> getManagerDetails() async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.accountManager);
    final value = await ApiService.fetchAccountManagerDetails().then((value) async {
      await box.clear();
      await HiveDataBase.saveSingleItem(box: box, data: value, key: HiveConfig.accountManager);
      accountManagerModel = AccountManagerModel.fromMap(value);
      return accountManagerModel;
    }).onError((error, stackTrace) async {
      final model = await HiveDataBase.getSingleItem(key: HiveConfig.accountManager, box: box);
      if(model != null) {
        accountManagerModel = AccountManagerModel.fromMap(model);
        return accountManagerModel;
      }
      return null;
    });
    await box.close();
    notifyListeners();
    return value;
  }
}
