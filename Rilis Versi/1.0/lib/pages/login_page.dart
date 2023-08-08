import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
        child: AppBarEmptyW(),
      ),
        backgroundColor: AppColors.whiteColor,
        body: Builder(builder: (BuildContext context) {
          return Stack(
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
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 32),
                          // padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                              // color: AppColors.whiteColor,
                              // borderRadius: BorderRadius.circular(16),
                              // boxShadow: const [
                              //   BoxShadow(
                              //     color: Color.fromRGBO(89, 27, 27, 0.05),
                              //     offset: Offset(0, 5),
                              //     blurRadius: 10,
                              //     spreadRadius: 0,
                              //   ),
                              // ],
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Opacity(
                                opacity: 0,
                                child: CustomIcon(
                                    iconName: 'icon_close',
                                    size: 24,
                                    color: AppColors.blackColor),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Text(
                                'Sign in to DyVolt Employee',
                                style: TextStyles.text22px500(),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const TextInput(
                                hintText: 'mobbin.cms2@gmail.com',
                                labelText: 'Email',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const PasswordInput(
                                hintText: 'XXXXXXXXXX',
                                labelText: 'Password',
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Forgot password',
                                  textAlign: TextAlign.right,
                                  style: TextStyles.textLink(),
                                ),
                              ),
                              const SizedBox(
                                height: 56,
                              ),
                              Button(
                                  labelText: 'Sign In',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(
                                          selectedIndex: 0,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
