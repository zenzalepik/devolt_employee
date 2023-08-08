import 'package:dyvolt_employee/pages/izin/izin_page.dart';
import 'package:dyvolt_employee/pages/lembur/lembur_page.dart';
import 'package:dyvolt_employee/pages/login_page.dart';
import 'package:dyvolt_employee/pages/performa/performa_mekanik_page.dart';
import 'package:dyvolt_employee/pages/presensi/presensi_page.dart';
import 'package:dyvolt_employee/pages/reimburs/reimburs_appbarback_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/arrow_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
        child: AppBarEmptyW(),
      ),
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
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 152,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(148 / 2),
                        border:
                            Border.all(width: 5, color: AppColors.whiteColor),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.asset(
                          'assets/images/img_profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 32,
                      child: Text(
                        'Mohammed Ali',
                        style: TextStyles.textSplashScreen(
                            color: AppColors.whiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Mechanic',
                      style:
                          TextStyles.text16px600(color: AppColors.whiteColor),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Presensi Kehadiran',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const PresensiPage(),
                                        ));},
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Performa Mekanik',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const PerformaMekanikPage(),
                                        ));},
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Perizinan Kerja',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const IzinPage(),
                                        ));},
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Reimburs',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const ReimbursAppbarbackPage(),
                                        ));},
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Lembur',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LemburPage(),
                                        ));
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ArrowMenuW(
                                  labelText: 'Logout',
                                  onTap: () {Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false,
      );},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
