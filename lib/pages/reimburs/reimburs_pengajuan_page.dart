import 'dart:convert';
import 'dart:io';
import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/utils/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:blur/blur.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dyvolt_employee/models/user.dart';
import 'package:dyvolt_employee/models/user_manager.dart';
import 'package:dyvolt_employee/services/connection_service.dart';
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
import 'package:http/http.dart' as http;

class ReimbursPengajuanContent extends StatefulWidget {
  @override
  State<ReimbursPengajuanContent> createState() =>
      _ReimbursPengajuanContentState();
}

class _ReimbursPengajuanContentState extends State<ReimbursPengajuanContent> {
  final _formKey = GlobalKey<FormState>();
  final UserManager _userManager = UserManager();
  String? token = "";
  String? name = "";
  int? id;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _allocationsController = TextEditingController();
  TextEditingController _ammountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();
  File? _cameraFile;
  String? _cameraFilePath;
  File? _imageFile;
  String? _imageFilePath;

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
        // email = user.email;
        name = user.name;
        id = user.id;
        // password = user.password;
        // phoneNumber = user.phoneNumber;
        // emailVerifiedAt = user.emailVerifiedAt;
        _userNameController.text = '$name';
        _userIdController.text = '$id';
      });
    }
  }

  Future<void> _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Your desired primary color
            hintColor: Colors.blue, // Your desired accent color
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yy-MM-dd')
            .format(pickedDate); // Update the date TextField value
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _imageFilePath = image.path; // Store the image file path
      });
    }
  }

  Future<void> _pickCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? camera = await _picker.pickImage(source: ImageSource.camera);

    if (camera != null) {
      setState(() {
        _cameraFile = File(camera.path);
        _cameraFilePath = camera.path; // Store the image file path
      });
    }
  }

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {}

    String userName = _userNameController.text;
    String userId = _userIdController.text;

    String allocations = _allocationsController.text;
    String ammount = _ammountController.text;
    String description = _descriptionController.text;
    String formattedDate = DateFormat('yy-MM-dd').format(_selectedDate!);

    List<int> cameraBytes = _cameraFile?.readAsBytesSync() ?? [];
    String base64Camera = base64Encode(cameraBytes);
    List<int> imageBytes = _imageFile?.readAsBytesSync() ?? [];
    String base64Image = base64Encode(imageBytes);

    Map<String, String> headers = {
      "Accept": "application/vnd.api+json",
      "Authorization": "Bearer $token",
      // "Bearer 106|SX7d5d6O2XqiaKr5r4XJo6sLCdoMIewCJSePj8iZ", // Replace with your token
    };

    Map<String, String> body = {
      "user_name": userName,
      "user_id": userId,
      "allocations": allocations,
      "ammount": ammount,
      "description": description,
      "date": formattedDate,
    };

    Uri apiUrl = Uri.parse(
        'https://dyvoltapi.programmerbandung.my.id/api/reimburse-store');
    http.MultipartRequest request = http.MultipartRequest('POST', apiUrl);
    request.headers.addAll(headers);
    request.fields.addAll(body);
    if (_imageFile != null) {
      request.files.add(http.MultipartFile(
        'proofs',
        _imageFile!.readAsBytes().asStream(),
        _imageFile!.lengthSync(),
        filename: 'file',
      ));
    } else if (_cameraFile != null) {
      request.files.add(http.MultipartFile(
        'proofs',
        _cameraFile!.readAsBytes().asStream(),
        _cameraFile!.lengthSync(),
        filename: 'file',
      ));
    }

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      var responseData = jsonDecode(responseBody);
      print("Data submitted successfully!");
      print("Response from server: $responseData");
      showStatusSnackbar(
          context, 'Pengajuan Reimburs Berhasil Dikirim!', Colors.green);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)),
          (route) => false,
        );
      });
    } else {
      print(formattedDate);
      print("Failed to submit data!");
      print("Error response from server: $responseBody");
      showStatusSnackbar(context, '$responseBody', Colors.red);
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
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 104 + 36 + 9 - 104 + 32 - 24,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                      Row(
                        children: [
                          Expanded(
                              child: Text('Pengajuan Reimburs',
                                  style: TextStyles.text24px600())),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: AppColors.bgCardDetail,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(children: [
                                    SvgPicture.asset(
                                        'assets/images/img_ornament_splash_1.svg'),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Nomor ID Pengaju',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: TextInputWhite(
                                                      controller:
                                                          _userIdController,
                                                      hintText: '#891315654',
                                                      whatTipe:
                                                          'filled_disable')),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Pengaju Reimburs',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextInputWhite(
                                                  controller:
                                                      _userNameController,
                                                  hintText:
                                                      'Tulis Pengaju Reimburs',
                                                  whatTipe: 'filled_disable',
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Alokasi Reimburs',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextInputWhite(
                                                  controller:
                                                      _allocationsController,
                                                  hintText: 'Alokasi Reimburs',
                                                  validator: FormValidator
                                                      .validateAlokasi,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Keterangan Reimburs',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextInputWhite(
                                                  controller:
                                                      _descriptionController,
                                                  hintText:
                                                      'Tulis Keterangan Reimburs',
                                                  validator: FormValidator
                                                      .validateKeterangan,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Tanggal Reimburs',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: DateInputW(
                                                  controller: _dateController,
                                                  labelText:
                                                      '12 - August - 2022',
                                                  onChanged:
                                                      (String SelectedDate) {
                                                    print(
                                                        'Selected Date: $SelectedDate');
                                                  },
                                                  validator: FormValidator
                                                      .validateTanggal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text('Biaya Realisasi',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextInputWhite(
                                                  whatTipe: 'number_curentcy',
                                                  controller:
                                                      _ammountController,
                                                  hintText: 'IDR 0,000,000',
                                                  validator: FormValidator
                                                      .validateAmmount,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text('Bukti',
                                                      style: TextStyles
                                                          .text12px600(
                                                              color: AppColors
                                                                  .blackColor))),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 8,
                                                    crossAxisSpacing: 12,
                                                  ),
                                                  itemCount: 2,
                                                  itemBuilder:
                                                      (context, index) {
                                                    if (index == 0) {
                                                      // Item kedua
                                                      return MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: _pickCamera,
                                                          child: Stack(
                                                            children: [
                                                              DottedBorder(
                                                                borderType:
                                                                    BorderType
                                                                        .RRect,
                                                                color: AppColors
                                                                    .grey2EColor, // color of dotted/dash line
                                                                strokeWidth:
                                                                    1, // thickness of dash/dots
                                                                dashPattern: const [
                                                                  8,
                                                                  4
                                                                ],
                                                                radius: const Radius
                                                                    .circular(8),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: _cameraFilePath !=
                                                                            null
                                                                        ? DecorationImage(
                                                                            image:
                                                                                FileImage(File(_cameraFilePath!)),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : null,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                ),
                                                              ),
                                                              Opacity(
                                                                opacity: 0.56,
                                                                child:
                                                                    Container(
                                                                  color: AppColors
                                                                      .bgGrey,
                                                                  width: 100,
                                                                  height: 100,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 39,
                                                                    height: 39,
                                                                    child:
                                                                        CustomIcon(
                                                                      iconName:
                                                                          'icon_camera',
                                                                      color: AppColors
                                                                          .grey63Color,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      // Item selain kedua
                                                      return MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: _pickImage,
                                                          child: Stack(
                                                            children: [
                                                              DottedBorder(
                                                                borderType:
                                                                    BorderType
                                                                        .RRect,
                                                                color: AppColors
                                                                    .grey2EColor, // color of dotted/dash line
                                                                strokeWidth:
                                                                    1, // thickness of dash/dots
                                                                dashPattern: const [
                                                                  8,
                                                                  4
                                                                ],
                                                                radius: const Radius
                                                                    .circular(8),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: _imageFilePath !=
                                                                            null
                                                                        ? DecorationImage(
                                                                            image:
                                                                                FileImage(File(_imageFilePath!)),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : null,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  // child:
                                                                  //     Image.asset(
                                                                  //   'assets/images/izin/sakit/img_izin_sakit_1.png',
                                                                  //   fit: BoxFit
                                                                  //       .cover,
                                                                  // ),
                                                                ),
                                                              ),
                                                              Opacity(
                                                                opacity: 0.56,
                                                                child:
                                                                    Container(
                                                                  color: AppColors
                                                                      .bgGrey,
                                                                  width: 100,
                                                                  height: 100,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30,
                                                                    height: 31,
                                                                    child:
                                                                        CustomIcon(
                                                                      iconName:
                                                                          'icon_image',
                                                                      color: AppColors
                                                                          .grey63Color,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: SizedBox(
                                                    height: 18,
                                                    child: TextFormField(
                                                      readOnly: true,
                                                      controller: TextEditingController(
                                                          text: _cameraFilePath != ''
                                                              ? '$_cameraFilePath'
                                                              : _imageFilePath != ''
                                                                  ? _imageFilePath
                                                                  : ''),
                                                      // decoration: InputDecoration(
                                                      //   border: UnderlineInputBorder(
                                                      //     borderSide:BorderSide(
                                                      //       width: 0.0,color: Colors.white.withOpacity(0.0)
                                                      //     )
                                                      // )
                                                      // ),
                                                      validator: FormValidator
                                                          .validateProofs,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    'Lengkapi formulir diatas untuk melakukan izin kerja',
                                                    style: TextStyles
                                                        .text12px300()),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 18),
                                          Button(
                                            labelText: 'Save',
                                            onPressed: _submitData,
                                          )
                                        ],
                                      ),
                                    )
                                  ]))),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
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
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AppBarBack(
            labelText: 'Reimburs',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

//
//
//
class ReimbursPengajuan extends StatefulWidget {
  const ReimbursPengajuan({super.key});

  @override
  _ReimbursPengajuanState createState() => _ReimbursPengajuanState();
}

class _ReimbursPengajuanState extends State<ReimbursPengajuan> {
  ValueNotifier<bool> visible = ValueNotifier<bool>(false);

  int _selectedIndex = 0;
  int fabOpacity = 1;
  bool fabMenuOpacity = false;
  bool animateOpacity = false;
  bool fabMenuIzinOpacity = false;
  bool fabMenuPresensiOpacity = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapFAB() {
    setState(() {
      fabOpacity = 0;
      fabMenuOpacity = true;
      animateOpacity = true;
    });
  }

  void _showFAB() {
    setState(() {
      fabOpacity = 1;
      fabMenuOpacity = false;
      animateOpacity = false;
      fabMenuPresensiOpacity = false;
    });
  }

  void _fabMenuPresensi() {
    setState(() {
      fabMenuOpacity = false;
      // animateOpacity = false;
      fabMenuPresensiOpacity = true;
    });
  }

  final List<Widget> _widgetOptions = [
    ReimbursPengajuanContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
        child: AppBarEmptyW(),
      ),
      // appBar: AppBar(title: Text('Bottom Navigation Bar')),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                fabOpacity == 0
                    ? SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Blur(
                          blur: 20,
                          blurColor: AppColors.blackColor,
                          child: _widgetOptions.elementAt(_selectedIndex),
                        ),
                      )
                    : _widgetOptions.elementAt(_selectedIndex),
                AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: animateOpacity ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Visibility(
                      visible: fabMenuOpacity,
                      child: FABMenuPopUp(
                        fabMenuPresensi: _fabMenuPresensi,
                        showFAB: _showFAB,
                      )),
                ),
                AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: animateOpacity ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Visibility(
                      visible: fabMenuPresensiOpacity, //fabMenuPresensiOpacity
                      child: PresensiPopUp(
                        onPressed: _showFAB,
                      )),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   color: AppColors.blackColor,
          // ),
          const Positioned(
              bottom: 0, right: 0, left: 0, child: BottomNavigationWidget()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Opacity(
        opacity: fabOpacity.toDouble(),
        child: Container(
          height: 44,
          width: 44,
          margin: const EdgeInsets.only(bottom: 28),
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.add, color: AppColors.whiteColor, size: 32),
            onPressed: () {
              fabOpacity == 1 ? _onTapFAB() : _showFAB();
            },
          ),
        ),
      ),
    );
  }
}
