import 'package:shared_preferences/shared_preferences.dart';

class ChacheHelper {
  static late SharedPreferences prefs;

  static Future<void> initCache() async {
    prefs = await SharedPreferences.getInstance();
  }
}
