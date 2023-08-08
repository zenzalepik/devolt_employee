import 'dart:async';

import 'package:dyvolt_employee/pages/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigasi ke halaman beranda menggunakan Timer
    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/img_ornament_splash_1.svg',
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/img_ornament_splash_2.svg',
            ),
          ),
          Center(
            child: SizedBox(
              width: 360 - 32,
              height: 200 + 12 + 32 + 56 + 32,
              child: Column(
                children: [
                  SizedBox(
                    width: 152,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: SvgPicture.asset(
                        'assets/images/dyvolt_app_logo.svg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 32,
                    child: Text(
                      'DyVolt Employee',
                      style: TextStyles.textSplashScreen(
                          color: AppColors.whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  const SizedBox(
                    height: 2,
                    width: 360 - 32 - 64,
                    child: RiveAnimation.asset(
                        'assets/animations/ani_loading_splash_screen.riv'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 32,
                    child: Text('Loading...',
                        style: TextStyles.textGoodMorning(
                            color: AppColors.blackColor)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
