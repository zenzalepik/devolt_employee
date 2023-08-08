import 'dart:convert';

import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/models/user.dart';
import 'package:dyvolt_employee/models/user_manager.dart';
import 'package:dyvolt_employee/pages/home_page.dart';
import 'package:dyvolt_employee/services/connection_service.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserManager _userManager = UserManager();
  // String authToken = Connection.authToken;

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn() async {
    User? user = await _userManager.getUserSession();
    if (user != null) {
      navigateToHomePage(context);
    }
  }

  Future<void> loginUser(BuildContext context) async {
    final url = Uri.parse(Connection.baseUrl + '/api/login');

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final authToken = jsonData['data']['token'];
        final userAttributes = jsonData['data']['attributes'];

        User user = User(
          id: userAttributes['id'],
          email: userAttributes['email'] ?? '',
          password: password,
          token: authToken,
          name: userAttributes['name'] ?? '',
          photoProfile: userAttributes['image'] ?? '',
          phoneNumber: userAttributes['phone_number'] ?? '',
          emailVerifiedAt: userAttributes['email_verified_at'] ?? '',
          gender: userAttributes['gender'] ?? '',
          birth_place: userAttributes['birth_place'] ?? '',
          birth_date: userAttributes['birth_date'] ?? '',
          maried_status: userAttributes['maried_status'] ?? '',
          country_id: userAttributes['country_id'] ?? '',
          // country_id: userAttributes[''] ?? '',
          province_id: userAttributes['province_id'] ?? '',
          // province_id: userAttributes[''] ?? '',
          city_id: userAttributes['city_id'] ?? '',
          // city_id: userAttributes[''] ?? '',
          district_id: userAttributes['district_id'] ?? '',
          // district_id: userAttributes[''] ?? '',
          area_id: userAttributes['area_id'] ?? '',
          // area_id: userAttributes[''] ?? '',
          pos_code: userAttributes['pos_code'] ?? '',
          address: userAttributes['address'] ?? '',
          blood_type: userAttributes['blood_type'] ?? '',
          last_education: userAttributes['last_education'] ?? '',
          bio: userAttributes['bio'] ?? '',
          nik: userAttributes['nik'] ?? '',
          npwp: userAttributes['npwp'] ?? '',
          nip: userAttributes['nip'] ?? '',
          // Add other user attributes as needed
        );

        await _userManager.saveUserSession(user);

        showStatusSnackbar(context, 'Login berhasil!', Colors.green);

        Future.delayed(Duration(seconds: 2), () {
          navigateToHomePage(context);
        });
      } else {
        print('Login gagal.');
        print('Kode status: ${response.statusCode}');
        print('Respon: ${response.body}');
        // printToken(context);

        showStatusSnackbar(context, 'Login gagal.', Colors.red);
      }
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
    }
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)),
      (Route<dynamic> route) => false,
    );
  }

  void showStatusSnackbar(
      BuildContext context, String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBarEmptyW(),
      ),
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child:
                  SvgPicture.asset('assets/images/img_ornament_splash_1.svg'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:
                  SvgPicture.asset('assets/images/img_ornament_splash_2.svg'),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Opacity(
                              opacity: 0,
                              child: CustomIcon(
                                iconName: 'icon_close',
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 28),
                            Text(
                              'Sign in to DyVolt Employee',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 32),
                            TextInput(
                              controller: _emailController,
                              hintText: 'mobbin.cms2@gmail.com',
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 16),
                            PasswordInput(
                              controller: _passwordController,
                              hintText: 'XXXXXXXXXX',
                              labelText: 'Password',
                            ),
                            const SizedBox(height: 48),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Forgot password',
                                textAlign: TextAlign.right,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            const SizedBox(height: 56),
                            Button(
                              onPressed: () {
                                loginUser(context);
                                printToken(context);
                              },
                              labelText: 'Sign In',
                            ),
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
      }),
    );
  }
}
