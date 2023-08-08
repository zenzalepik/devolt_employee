

import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/models/user.dart';
import 'package:dyvolt_employee/models/user_manager.dart';
import 'package:flutter/material.dart';

class Connection {
  static const String baseUrl = 'https://dyvoltapi.programmerbandung.my.id';
}

void printToken(BuildContext context) async {
    UserManager userManager = UserManager();
    User? user = await userManager.getUserSession();
    if (user != null) {
      print("Token: ${user.token}");
    } else {
      print("User session not found.");
    }
  }  


  
  void navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(selectedIndex: 0),
      ),
    );
  }