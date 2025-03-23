import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences? _preferences;

  // Initialize shared preferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save string value
  static Future<bool> setString(String key, String value) async {
    if (_preferences == null) await init();
    return await _preferences!.setString(key, value);
  }

  // Get string value
  static String getString(String key, {String defaultValue = ''}) {
    if (_preferences == null) return defaultValue;
    return _preferences!.getString(key) ?? defaultValue;
  }

  // Save int value
  static Future<bool> setInt(String key, int value) async {
    if (_preferences == null) await init();
    return await _preferences!.setInt(key, value);
  }

  // Get int value
  static int getInt(String key, {int defaultValue = 0}) {
    if (_preferences == null) return defaultValue;
    return _preferences!.getInt(key) ?? defaultValue;
  }

  // Save boolean value
  static Future<bool> setBool(String key, bool value) async {
    if (_preferences == null) await init();
    return await _preferences!.setBool(key, value);
  }

  // Get boolean value
  static bool getBool(String key, {bool defaultValue = false}) {
    if (_preferences == null) return defaultValue;
    return _preferences!.getBool(key) ?? defaultValue;
  }

  // Save double value
  static Future<bool> setDouble(String key, double value) async {
    if (_preferences == null) await init();
    return await _preferences!.setDouble(key, value);
  }

  // Get double value
  static double getDouble(String key, {double defaultValue = 0.0}) {
    if (_preferences == null) return defaultValue;
    return _preferences!.getDouble(key) ?? defaultValue;
  }

  // Save string list
  static Future<bool> setStringList(String key, List<String> value) async {
    if (_preferences == null) await init();
    return await _preferences!.setStringList(key, value);
  }

  // Get string list
  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    if (_preferences == null) return defaultValue;
    return _preferences!.getStringList(key) ?? defaultValue;
  }

  // Check if key exists
  static bool containsKey(String key) {
    if (_preferences == null) return false;
    return _preferences!.containsKey(key);
  }

  // Remove a specific key
  static Future<bool> remove(String key) async {
    if (_preferences == null) await init();
    return await _preferences!.remove(key);
  }

  // Clear all data
  static Future<bool> clear() async {
    if (_preferences == null) await init();
    return await _preferences!.clear();
  }
}
