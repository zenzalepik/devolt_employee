import 'package:flutter/material.dart';

class Shadows {
  static const BoxShadow boxShadow1 = BoxShadow(
    color: Color.fromRGBO(89, 27, 27, 0.05),
    offset: Offset(0, 5),
    blurRadius: 10,
    spreadRadius: 0,
  );

  static const BoxShadow boxShadow2 = BoxShadow(
    color: Colors.black,
    offset: Offset(2, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow shadowTabBar = BoxShadow(
    color: Color(0x591B1B0D), // Warna bayangan
    offset: Offset(0, 5), // Posisi bayangan
    blurRadius: 10, // Jumlah blur
    spreadRadius: 0, // Jumlah penyebaran
  );

  static const BoxShadow shadowContainer = BoxShadow(
    color: Color.fromRGBO(89, 27, 27, 0.05),
    offset: Offset(0, 5),
    blurRadius: 10,
  );
}
