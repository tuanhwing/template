

import 'package:shared_preferences/shared_preferences.dart';

class TPUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> saveData(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<void> deleteData(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);

  }

  static Future<String> loadData(String key) async {
    final prefs = await _prefs;
    return prefs.get(key);
  }
}