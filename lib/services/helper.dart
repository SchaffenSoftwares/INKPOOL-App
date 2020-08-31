import 'package:shared_preferences/shared_preferences.dart';

class HelperFunc {
  static String userNameKey = "USERNAMEKEY";
  static String loggedInKey = "LOGGEDINKEY";

  static Future<bool> saveUsername(String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(userNameKey, username);
  }

  static Future<bool> saveUserloggedIn(bool isUserLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(loggedInKey, isUserLoggedIn);
  }

  static Future<String> getUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userNameKey);
  }

  static Future<bool> getUserloggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(loggedInKey);
  }
}