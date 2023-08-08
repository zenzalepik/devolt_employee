import 'dart:convert';

import 'package:dyvolt_employee/models/user.dart';
import 'package:dyvolt_employee/models/user_manager.dart';
import 'package:dyvolt_employee/pages/izin/izin_page.dart';
import 'package:dyvolt_employee/pages/lembur/lembur_page.dart';
import 'package:dyvolt_employee/pages/login_page.dart';
import 'package:dyvolt_employee/pages/performa/performa_mekanik_page.dart';
import 'package:dyvolt_employee/pages/presensi/presensi_page.dart';
import 'package:dyvolt_employee/pages/profile/pengaturan_page.dart';
import 'package:dyvolt_employee/pages/reimburs/reimburs_appbarback_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/arrow_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  String? _imageFilePath;
  final UserManager _userManager = UserManager();
  String opacityButtonUpload = '';

  void _logoutUser(BuildContext context) async {
    UserManager userManager = UserManager();
    await userManager.clearUserSession(); // Clear user session data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(), // Navigate back to the login page
      ),
    );
  }

  String? token = "";
  String? name = "";
  int? id;
  String? password = "";
  String? phoneNumber = "";
  String? emailVerifiedAt = "";
  String? email;
  dynamic photoProfile;

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
        email = user.email;
        name = user.name;
        id = user.id;
        password = user.password;
        phoneNumber = user.phoneNumber;
        emailVerifiedAt = user.emailVerifiedAt;
        photoProfile = user.photoProfile;
      });
    }
  }

  // Future<void> _updatePhotoProfile() async {
  // }
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _imageFilePath = image.path; // Store the image file path
      });
    }
    if (_imageFile == null) {
      print("No image selected!");
      showStatusSnackbar(context, 'Pilih gambar terlebih dahulu', Colors.red);
      return;
    }

    String userId = '$id';
    List<int> imageBytes = _imageFile!.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    Map<String, String> headers = {
      "Accept": "application/vnd.api+json",
      "Authorization": "Bearer $token", // Replace with your token
    };

    Map<String, String> body = {
      "user_id": userId,
    };

    Uri apiUrl = Uri.parse(
        'https://dyvoltapi.programmerbandung.my.id/api/user/changepicture');
    http.MultipartRequest request = http.MultipartRequest('POST', apiUrl);
    request.headers.addAll(headers);
    request.fields.addAll(body);

    request.files.add(http.MultipartFile(
      'image', // Make sure this matches the field name expected by the server
      _imageFile!.readAsBytes().asStream(),
      _imageFile!.lengthSync(),
      filename: 'file',
    ));

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      var responseData = jsonDecode(responseBody);
      print("Photo Berhasil Diganti!");
      print("Response from server: $responseData");
      showStatusSnackbar(context, 'Photo Berhasil Diganti!', Colors.green);
      setState(() {
        opacityButtonUpload = '';
        // _imageFile = null;
      });
    } else {
      print("Failed to submit data!");
      print("Error response from server: $responseBody");
      showStatusSnackbar(context, '$responseBody', Colors.red);
      setState(() {
        opacityButtonUpload = '';
        // _imageFile = null;
      });
    }
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
                    GestureDetector(
                      onTap: () {
                        _showUploadImageDialog(context);
                        setState(() {
                          opacityButtonUpload = 'tampil';
                        });
                      },
                      child: Container(
                        width: 152,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(148 / 2),
                          border:
                              Border.all(width: 5, color: AppColors.whiteColor),
                        ),
                        child: Container(
                          height: 152 - 10,
                          width: 152 - 10,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular((152 - 10) / 2)),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            // child: _selectedImage != null
                            //     ? Image.file(
                            //         _selectedImage!,
                            //         fit: BoxFit.cover,
                            //       )
                            // :
                            child: _imageFile != null
                                ? Image.file(
                                    _imageFile!,
                                    fit: BoxFit.cover,
                                  )
                                : photoProfile != ''
                                    ? Image.network('$photoProfile',
                                        fit: BoxFit.cover)
                                    : Image.asset(
                                        'assets/images/img_profile.png',
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                      ),
                    ),
                    // Visibility(
                    //   visible: opacityButtonUpload != ''
                    //       ? true
                    //       : _imageFile != null
                    //           ? true
                    //           : false,
                    //   child: Column(
                    //     children: [
                    //       SizedBox(height: 24),
                    //       ElevatedButton(
                    //         onPressed:
                    //             _updatePhotoProfile // Add the submit function to the button
                    //         ,
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.cloud_upload),
                    //             Text('Unggah Gambar',
                    //                 style: TextStyles.text16px600(
                    //                     color: AppColors.whiteColor))
                    //           ],
                    //         ),
                    //         style: ElevatedButton.styleFrom(
                    //           primary: AppColors.secondaryColor,
                    //           padding: EdgeInsets.all(16),

                    //           // Anda juga dapat menyesuaikan properti lain seperti padding, shape, dll.
                    //         ),
                    //       ),
                    //       SizedBox(height: 24),
                    //     ],
                    //   ),
                    // ),
                  
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PengaturanPage(),
                            ));
                      },
                      child: SizedBox(
                        height: 32,
                        child: Text(
                          '$name',
                          style: TextStyles.textSplashScreen(
                              color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PengaturanPage(),
                            ));
                      },
                      child: Text(
                        'Mechanic',
                        style:
                            TextStyles.text16px600(color: AppColors.whiteColor),
                      ),
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
                                          builder: (context) =>
                                              const PresensiPage(),
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
                                  labelText: 'Performa Mekanik',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PerformaMekanikPage(),
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
                                  labelText: 'Perizinan Kerja',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const IzinPage(),
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
                                  labelText: 'Reimburs',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ReimbursAppbarbackPage(),
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
                                  labelText: 'Lembur',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LemburPage(),
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
                                  onTap: () {
                                    _logoutUser(context);
                                  },
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

  void _showUploadImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Container(
            width: 12 + 12 + 56,
            height: 12 + 12 + 56,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: AppColors.primaryColor.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(24)),
            child: CustomIcon(
              iconName: 'icon_setting_profil',
              color: AppColors.primaryColor,
              size: 56,
            ),
          ),
          // shape: ShapeBorder(

          // )
          title: Text('Ganti Foto Profil'),
          content: Text(
              'Foto lama anda akan terhapus bila anda mengganti foto profil',
              textAlign: TextAlign.center,
              style: TextStyles.text14px500()),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Unggah gambar'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _pickImage();
                setState(() {
                  opacityButtonUpload = '';
                });
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors
                    .primaryColor, // Ganti dengan warna yang Anda inginkan
                // Anda juga dapat menyesuaikan properti lain seperti padding, shape, dll.
              ),
            ),
            ElevatedButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  opacityButtonUpload = '';
                });
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors
                    .labelErrorColor, // Ganti dengan warna yang Anda inginkan
                // Anda juga dapat menyesuaikan properti lain seperti padding, shape, dll.
              ),
            ),
          ],
        );
      },
    );
  }
}
