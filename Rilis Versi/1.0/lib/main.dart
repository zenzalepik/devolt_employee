import 'package:flutter/material.dart';
import 'package:dyvolt_employee/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
          child: AppBar(),
        ),
        body: SplashScreen(),
      ),
    );
  }
}
