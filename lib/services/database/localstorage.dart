import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<bool> saveStringData(String Key ,String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString(Key, value);
    return result;
  }

  static Future<String?> getStringData(String Key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currentTheme = sharedPreferences.getString(Key);
    return currentTheme;
  }
  static Future clearLocalDB() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();

  }
}