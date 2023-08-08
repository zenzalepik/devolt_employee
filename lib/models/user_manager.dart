import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';


class UserManager {
  Future<User?> getUserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  Future<void> saveUserSession(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(user.toJson()));
  }

  Future<void> clearUserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }
}
