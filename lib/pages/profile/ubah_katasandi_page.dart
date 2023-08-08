import 'dart:convert';
import 'dart:io';
import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/services/connection_service.dart';
import 'package:dyvolt_employee/utils/validators.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dyvolt_employee/models/user.dart';
import 'package:dyvolt_employee/models/user_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:blur/blur.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/bottom_navigationbar.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:dyvolt_employee/widgets/fab_menu_pop_up.dart';
import 'package:dyvolt_employee/widgets/presensi_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UbahKataSandiPage extends StatefulWidget {
  const UbahKataSandiPage({super.key});

  @override
  State<UbahKataSandiPage> createState() => _UbahKataSandiPageState();
}

class _UbahKataSandiPageState extends State<UbahKataSandiPage> {
  String? token;
  String? user_id;
  TextEditingController _userPasswordBaruController = TextEditingController();
  TextEditingController _userPasswordBaruUlangiController =
      TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadToken();
    loadDataUser();
  }

  void loadToken() async {
    UserManager userManager = UserManager();
    User? user = await userManager.getUserSession();
    if (user != null) {
      setState(() {
        token = user.token;
      });
    }
  }

  void loadDataUser() async {
    UserManager userManager = UserManager();
    User? user = await userManager.getUserSession();
    if (user != null) {
      setState(() {
        user_id = '${user.id}';
      });
    }
  }

  // final _formKey = GlobalKey<FormState>();
  Future<void> _submitData() async {
    String id = '$user_id';
    String newPassword = _userPasswordBaruController.text;
    String confirmPassword = _userPasswordBaruUlangiController.text;

    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();}

      // Request body as a Map
      Map<String, dynamic> body = {
        "id": id,
        "password": newPassword,
        "password_confirmation": confirmPassword,
      };

      // Request headers
      Map<String, String> headers = {
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": "Bearer $token",
      };

      // API URL
      String apiUrl = Connection.baseUrl + "/api/user/changepass";

      // Sending POST request
      http.Response response = await http.post(Uri.parse(apiUrl),
          body: jsonEncode(body), // Convert body to JSON string
          headers: headers);

      // Handling the response
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        String message = responseData["message"];
        print("Password Berhasil Diperbarui!");
        print("$message");
        print("Response from server: $responseData");
        showStatusSnackbar(
            context, 'Password Berhasil Diperbarui!', Colors.green);
        // Future.delayed(Duration(seconds: 3), () {
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)),
        //   (route) => false,
        // );
        // });
      } else {
        var errorData = jsonDecode(response.body);
        String errorMessage = errorData["message"];
        print("Gagal memperbarui password");
        print("Error response from server: $errorData");
        showStatusSnackbar(context, 'Gagal memperbarui password', Colors.red);
      }
    // }
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
        body: ScaffoldMessenger(
          child: Builder(builder: (BuildContext context) {
            return Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 104 + 36 + 9 - 104 + 32 - 24,
                      ),
                      const SizedBox(
                        height: 12 + 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: PasswordInput(
                                            controller:
                                                _userPasswordBaruController,
                                            labelText: 'Password Baru $user_id',
                                            hintText: '********',
                                            validator:
                                                FormValidator.validatePassword,
                                            // whatTipe: 'filled_disable'
                                          )),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: PasswordInput(
                                                controller:
                                                    _userPasswordBaruUlangiController,
                                                hintText: '********',
                                                labelText: 'Ulangi Password',
                                                validator: FormValidator
                                                    .validatePasswordUlangi
                                                // whatTipe: 'filled_disable',
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Lengkapi formulir diatas untuk melakukan izin kerja',
                                                style:
                                                    TextStyles.text12px300()),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ButtonDark(
                                              labelText: 'Kembali',
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Button(
                                              labelText: 'Simpan',
                                              onPressed: _submitData,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40)
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: AppBarBackWhite(
                    labelText: 'Ubah Password',
                    onBack: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
