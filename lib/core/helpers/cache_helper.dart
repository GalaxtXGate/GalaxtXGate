import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required key, required dynamic value}) async {
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setString(key, value);
    }
  }

  static Future<bool> saveJson({required key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> updateData({required String key, required value}) async {
    await sharedPreferences.remove(key);
    await saveData(key: key, value: value);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
