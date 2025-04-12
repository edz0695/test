import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payapp/core/components/print_text.dart';

class HiveDataBase{

  static Future<void> init()async{
    await Hive.initFlutter();
    var dir = await getApplicationDocumentsDirectory();
    printThis(dir);
    Hive.init(dir.path);
  }

  static Future<Box> openBox({required String boxName}) async {
    Box box;
    box = await Hive.openBox(boxName);
    return box;
  }

  static Future<void> closeBox({required Box box}) async {
    await box.close();
  }

  static Future saveData(Box box,var data) async {
    box.addAll(data);
  }

  static Future getData(Box box) async {
    if(box.isEmpty){
      return [];
    }
    List list =  box.toMap().values.toList();
    return list;
  }

  static Future saveSingleItem({required dynamic key,required Box box,required data})async{
    await box.put(key,data);
  }

  static Future deleteSingleItem({required dynamic key,required Box box})async{
    await box.delete(key);
  }

  static Future getSingleItem({required dynamic key,required Box box}) async {
    var value = await box.get(key);
    return value;
  }

  static Future getItemStatus({required dynamic key,required Box box}) async{
    return box.containsKey(key);
  }
}