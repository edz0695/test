import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:payapp/data/api/api_client.dart';
import 'package:payapp/models/settingsmodel.dart';
import 'package:http/http.dart' as http;

class SettingsProvider extends ChangeNotifier {
  SettingsModel? settingsModel;

  //todo: add loading boolean here to avoid null check.
  SettingsProvider() {
    getIntroVideo();
  }

  Future getIntroVideo()async{
    final Uri url = Uri.parse("https://xyzabc.sambhavapps.com/v1/HomeIntro");
    final http.Response response = await http.get(url, headers: {
      'Authorization': 'Bearer $loginToken',
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      final source = response.body;

      var responseData = jsonDecode(source);
      final data = responseData["data"] as List;
      return data[0]['video']??"";
    } else {
      return "";
    }
  }

/*  Future<SettingsModel?> getSystemSettings() async {
    Box box = await HiveDataBase.openBox(boxName: HiveConfig.appSetting);
    try{
      print("data is loading");
      final value = await ApiService.fetchSystemSettings().then((value) async {
        await box.clear();
        await HiveDataBase.saveSingleItem(box: box, data: value, key: HiveConfig.appSetting);
        settingsModel = SettingsModel.fromMap(value);
        print(settingsModel?.appLogo);
        return settingsModel;
      }).onError((error, stackTrace) async {
        final model = await HiveDataBase.getSingleItem(key: HiveConfig.appSetting, box: box);
        if (model != null) {
          settingsModel = SettingsModel.fromMap(model);
          return settingsModel;
        }
      });
      await box.close();
      notifyListeners();
      return value;
    }
    catch(e){
      print("errrrrrrrrrrrrrrr");
      print(e);
    }

  }*/
}
