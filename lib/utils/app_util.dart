import 'dart:convert';
import 'package:get_storage/get_storage.dart';

abstract class AppUtil {
  static late GetStorage storage;
  static Future<void> init() async {
    await GetStorage.init();
    storage = GetStorage();
  }

  static String? getString(key) => storage.read(key);
  static Future<void> setString(key, value) async =>
      await storage.write(key, value);

  static Map? getJson(key) {
    String? strString = storage.read(key);
    if (strString == null) return null;
    return jsonDecode(strString);
  }

  static Future<void> setJosn(key, value) async =>
      await storage.write(key, jsonEncode(value));

  static Future<void> remove(key) async => await storage.remove(key);

  static bool? getBool(key) => storage.read(key);

  static Future<void> setBool(key, value) async =>
      await storage.write(key, value);
}
