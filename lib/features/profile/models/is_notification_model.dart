import 'package:shared_preferences/shared_preferences.dart';

class IsNotificationModel {
  static const String isNotificationKey = "isNotification";

  static bool isNotification = true; // Default value

  static Future<void> saveIsNotification(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isNotificationKey, value);
  }

  static Future<void> loadIsNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotification = prefs.getBool(isNotificationKey) ?? true; 
  }
}