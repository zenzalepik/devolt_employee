import 'package:dyvolt_employee/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBarEmptyW extends StatelessWidget {
  const AppBarEmptyW({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        );
  }
}