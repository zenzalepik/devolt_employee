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

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  dynamic? selectedCountryId; // Tipe diubah menjadi nullable
  dynamic? selectedProvinceId; // Tipe diubah menjadi nullable
  dynamic? selectedCityId; // Tipe diubah menjadi nullable
  dynamic? selectedDistrictId; // Tipe diubah menjadi nullable
  dynamic? selectedAreaId; // Tipe diubah menjadi nullable
  // final List<String> dropDownItems = ['Item 1', 'Item 2', 'Item 3'];
  String? selectedValue;
  final UserManager _userManager = UserManager();
  String? token;
  String? name;
  int? id;
  String? email;
  String? phoneNumber;
  String? gender;
  String? birth_place;
  String? birth_date;
  String? maried_status;
  String? country_id;
  String? province_id;
  String? city_id;
  String? district_id;
  String? area_id;
  String? pos_code;
  String? address;
  String? blood_type;
  String? last_education;
  String? bio;
  String? nik;
  String? npwp;
  String? nip;
  int? enabled;

  String? selectedValueStatusNikah;
  String? selectedValueTipeDarah;

  int? _selectedGender;
  String _selectedTitleGender = '';

  Map<String, int> _genderValues = {
    'L': 0,
    'P': 1,
  };

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  // TextEditingController _genderController = TextEditingController();
  TextEditingController _birth_placeController = TextEditingController();
  TextEditingController _birth_dateControllerText = TextEditingController();
  DateTime? _birth_dateController = DateTime.now();
  String selectedDate =
      ''; // Tambahkan variabel untuk menyimpan nilai tanggal yang dipilih

  TextEditingController _maried_statusController = TextEditingController();
  TextEditingController _country_idController = TextEditingController();
  TextEditingController _province_idController = TextEditingController();
  TextEditingController _city_idController = TextEditingController();
  TextEditingController _district_idController = TextEditingController();
  TextEditingController _area_idController = TextEditingController();
  TextEditingController _pos_codeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _blood_typeController = TextEditingController();
  TextEditingController _last_educationController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _npwpController = TextEditingController();
  TextEditingController _nipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadToken();
    loadDataUser();
    enabled = 1;
    // name = 'Moh. Zainul Muttaqin';
    // email = 'mzainulmzz@gmail.com';
    updateUser(context);
    print('$token');
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
        id = user.id;
        _emailController.text = '${user.email}';
        _nameController.text = '${user.name}';
        _phoneNumberController.text = '${user.phoneNumber}';
        gender = user.gender;
        _selectedGender = _genderValues['$gender'];
        // birth_place = user.birth_place;
        _birth_placeController.text = '${user.birth_place}';
        // _birth_dateController =
        //     DateFormat("yyyy-MM-dd").parse(user.birth_date!);
        _birth_dateControllerText.text = '${user.birth_date}';
        maried_status = user.maried_status;
        selectedValueStatusNikah = maried_status;
        country_id = user.country_id;
        selectedCountryId = '$country_id';
        province_id = user.province_id;
        selectedProvinceId = '$province_id';
        city_id = user.city_id;
        selectedCityId = '$city_id';
        district_id = user.district_id;
        selectedDistrictId = '$district_id';
        area_id = user.area_id;
        selectedAreaId = '$area_id';
        _pos_codeController.text = '${user.pos_code}';
        _addressController.text = '${user.address}';
        blood_type = user.blood_type;
        selectedValueTipeDarah = blood_type;
        _last_educationController.text = '${user.last_education}';
        _bioController.text = '${user.bio}';
        _nikController.text = '${user.nik}';
        _npwpController.text = '${user.npwp}';
        _nipController.text = '${user.nip}';
        print('$token');
      });
    }
  }

  Future<void> _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _birth_dateController ?? DateTime.now(),
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
    if (pickedDate != null && pickedDate != _birth_dateController) {
      setState(() {
        _birth_dateController = pickedDate;
        _birth_dateControllerText.text = DateFormat('yyyy-MM-dd')
            .format(pickedDate); // Update the date TextField value
      });
    }
  }

  void _handleGenderValueChange(int? value) {
    setState(() {
      _selectedGender = value;
      if (value != null) {
        _selectedTitleGender = _genderValues.keys.firstWhere(
          (title) => _genderValues[title] == value,
          orElse: () => 'Unknown',
        );
        print('Selected Radio Button Title: $_selectedTitleGender');
      }
    });
  }

  void updateUserLocal() async {
    setState(() {
      email = _emailController.text;
      name = _nameController.text;
      phoneNumber = _phoneNumberController.text;
      // _selectedGender = _genderValues['L'];
      gender = _selectedTitleGender;
      birth_place = _birth_placeController.text;
      birth_date = selectedDate;
      maried_status = selectedValueStatusNikah;
      country_id = selectedCountryId;
      province_id = selectedProvinceId;
      city_id = selectedCityId;
      district_id = selectedDistrictId;
      area_id = selectedAreaId;
      pos_code = _pos_codeController.text;
      address = _addressController.text;
      blood_type = selectedValueTipeDarah;
      last_education = _last_educationController.text;
      bio = _bioController.text;
      nik = _nikController.text;
      npwp = _npwpController.text;
      nip = _nipController.text;
      enabled = 1;
    });
  }

  Future<void> updateUser(BuildContext context) async {
    updateUserLocal();
    final url = Uri.parse(Connection.baseUrl + '/api/user/$id');

    try {
      // await updateUserLocal();
      final response = await http.patch(
        url,
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: {
          'email': email!,
          'name': name!,
          'phone_number': phoneNumber!,
          'gender': gender!,
          'birth_place': birth_place!,
          'birth_date': birth_date!,
          'maried_status': maried_status!,
          'country_id': country_id!,
          'province_id': province_id!,
          'city_id': city_id!,
          'district_id': district_id!,
          'area_id': area_id!,
          'pos_code': pos_code!,
          'address': address!,
          'blood_type': blood_type!,
          'last_education': last_education!,
          'bio': bio!,
          'nik': nik!,
          'npwp': npwp!,
          'nip': nip!,
          'enabled': enabled.toString(),
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // final authToken = jsonData['data']['token'];
        // final userAttributes = jsonData['data'];
        print('Respon: ${response.body}');

        showStatusSnackbar(context, 'Data berhasil diupdate!', Colors.green);
        // print('$_selectedGender');
      } else {
        print('Gagal mengupdate data.');
        print('Kode status: ${response.statusCode}');
        print('Respon: ${response.body}');
        // printToken(context);

        showStatusSnackbar(context, 'Gagal mengupdate data.', Colors.red);
      }
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
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
    return ScaffoldMessenger(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBarEmptyW(),
          ),
          backgroundColor: Colors.white,
          body: Builder(builder: (BuildContext context) {
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
                                              child: Text('Nama Lengkap',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: TextInputWhiteOutline(
                                            controller: _nameController,
                                            hintText: 'Mohammed Ali',
                                            // whatTipe: 'filled_disable'
                                          )),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Tempat Lahir',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              controller: _birth_placeController,
                                              hintText: 'Bogor',
                                              // whatTipe: 'filled_disable',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Tanggal Lahir',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: DateInputOutlineW(
                                              controller:
                                                  _birth_dateControllerText,
                                              labelText: _birth_dateController !=
                                                      null
                                                  ? DateFormat('yyyy-MM-dd')
                                                      .format(
                                                          _birth_dateController!)
                                                  : 'Pilih Tanggal', // Atau string default yang sesuai
                                              onChanged: (String selectedDate) {
                                                print(
                                                    'Selected Date: $selectedDate');
                                                setState(() {
                                                  this.selectedDate =
                                                      selectedDate; // Perbarui nilai selectedDate saat tanggal berubah
                                                });
                                                // setState(() {
                                                //   _birth_dateController = '$selectedDate';
                                                //   _birth_dateControllerText.text = DateFormat('yyyy-MM-dd')
                                                //       .format(pickedDate); // Update the date TextField value
                                                // });
                                              },
                                              validator:
                                                  FormValidator.validateTanggal,
                                            ),
                                          ),
                                        ],
                                      ),
    
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Jenis Kelamin',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children:
                                                _genderValues.keys.map((title) {
                                              return RadioListTile<int?>(
                                                activeColor:
                                                    AppColors.primaryColor,
                                                title: Text(title == 'L'
                                                    ? 'Laki-Laki'
                                                    : 'Perempuan'),
                                                value: _genderValues[title],
                                                groupValue: _selectedGender,
                                                onChanged:
                                                    _handleGenderValueChange,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Tipe Darah',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      DropdownOutlineW(
                                        labelText: blood_type != ''
                                            ? '$blood_type'
                                            : 'Pilih tipe darah', // Label untuk dropdown
                                        items: [
                                          'A',
                                          'B',
                                          'AB',
                                          'O',
                                        ], // Daftar item yang akan ditampilkan
                                        onChanged: (value) {
                                          // Ketika nilai dropdown berubah
                                          // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                          setState(() {
                                            selectedValueTipeDarah = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Negara & Provinsi',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      CountryDropdown(
                                        selectedCountryId: selectedCountryId,
                                        onCountrySelected: (selectedId) {
                                          setState(() {
                                            selectedCountryId = selectedId;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Spacer widget untuk memberikan jarak antara dropdown dan teks
                                      Text(
                                        selectedCountryId ??
                                            'Belum memilih negara', // Jika selectedCountryId null, tampilkan teks 'Belum memilih negara'
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 6),
                                      ProvinceDropdown(
                                        selectedProvinceId: selectedProvinceId,
                                        onProvinceSelected: (selectedId) {
                                          setState(() {
                                            selectedProvinceId = selectedId;
                                          });
                                        },
                                        selectedCountryId: selectedCountryId,
                                      ),
                                      Text(
                                        selectedProvinceId ??
                                            'Belum memilih Provinse', // Jika selectedCountryId null, tampilkan teks 'Belum memilih negara'
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Kota & Kecamatan',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
    
                                      CityDropdown(
                                        selectedCityId: selectedCityId,
                                        onCitySelected: (selectedId) {
                                          setState(() {
                                            selectedCityId = selectedId;
                                          });
                                        },
                                        selectedCountryId: selectedCountryId,
                                        selectedProvinceId: selectedProvinceId,
                                      ),
                                      Text(
                                        selectedCityId ??
                                            'Belum memilih Provinse', // Jika selectedCountryId null, tampilkan teks 'Belum memilih negara'
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 6),
    
                                      DistrictDropdown(
                                        selectedDistrictId: selectedDistrictId,
                                        onDistrictSelected: (selectedId) {
                                          setState(() {
                                            selectedDistrictId = selectedId;
                                          });
                                        },
                                        selectedCountryId: selectedCountryId,
                                        selectedProvinceId: selectedProvinceId,
                                        selectedCityId: selectedCityId,
                                      ),
                                      Text(
                                        selectedDistrictId ??
                                            'Belum memilih Kota/Kabupaten', // Jika selectedCountryId null, tampilkan teks 'Belum memilih negara'
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Area & Kode Pos',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      AreaDropdown(
                                        selectedAreaId: selectedAreaId,
                                        onAreaSelected: (selectedId) {
                                          setState(() {
                                            selectedAreaId = selectedId;
                                          });
                                        },
                                        selectedCountryId: selectedCountryId,
                                        selectedProvinceId: selectedProvinceId,
                                        selectedCityId: selectedCityId,
                                        selectedDistrictId: selectedDistrictId,
                                      ),
                                      Text(
                                        selectedAreaId ??
                                            'Belum memilih Kecamatan', // Jika selectedCountryId null, tampilkan teks 'Belum memilih negara'
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
    
                                      // const SizedBox(height: 18),
                                      const SizedBox(height: 6),
    
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              controller: _pos_codeController,
                                              hintText: 'Kode Pos',
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
                                              child: Text('Alamat/Jalan',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
    
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextAreaWhiteOutline(
                                              controller: _addressController,
                                              hintText: 'Alamat Lengkap',
                                              // validator: FormValidator
                                              //     .validateKeterangan,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Email',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              controller: _emailController,
                                              hintText: 'MohammedAli@gmail.com',
                                              validator:
                                                  FormValidator.validateAlokasi,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Nomer Handphone',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              controller: _phoneNumberController,
                                              hintText: '089666890657',
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
                                              child: Text('NIK',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              // whatTipe: 'number_curentcy',
                                              controller: _nikController,
                                              hintText: '0987129438709872',
                                              validator:
                                                  FormValidator.validateAmmount,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('NPWP',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              // whatTipe: 'number_curentcy',
                                              controller: _npwpController,
                                              hintText: '0981720498170294',
                                              validator:
                                                  FormValidator.validateAmmount,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('NIP',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              // whatTipe: 'number_curentcy',
                                              controller: _nipController,
                                              hintText: '123456',
                                              validator:
                                                  FormValidator.validateAmmount,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Last Education',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextInputWhiteOutline(
                                              // whatTipe: 'number_curentcy',
                                              controller:
                                                  _last_educationController,
                                              hintText: 'S2',
                                              validator:
                                                  FormValidator.validateAmmount,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Status',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      DropdownOutlineW(
                                        labelText: maried_status != ''
                                            ? '$maried_status'
                                            : 'Status pernikahan', // Label untuk dropdown
                                        items: [
                                          'Menikah',
                                          'Belum Menikah',
                                        ], // Daftar item yang akan ditampilkan
                                        onChanged: (value) {
                                          // Ketika nilai dropdown berubah
                                          // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                          setState(() {
                                            selectedValueStatusNikah = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('Bio',
                                                  style: TextStyles.text12px600(
                                                      color:
                                                          AppColors.blackColor))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextAreaWhiteOutline(
                                              // whatTipe: 'number_curentcy',
                                              controller: _bioController,
                                              hintText: 'Ini adalah bio',
                                              validator:
                                                  FormValidator.validateAmmount,
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
                                                style: TextStyles.text12px300()),
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
                                              onPressed: () {
                                                updateUserLocal();
                                                updateUser(context);
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
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
                    labelText: 'Personal Data',
                    onBack: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          })),
    );
  }
}

//
//
//
class CountryDropdown extends StatefulWidget {
  final void Function(String?)
      onCountrySelected; // Tambahkan parameter untuk callback
  final String selectedCountryId;

  CountryDropdown(
      {required this.selectedCountryId,
      required this.onCountrySelected}); // Constructor dengan parameter callback

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  List<Map<String, dynamic>> countriesData = [];
  String? selectedCountryId;

  @override
  void initState() {
    super.initState();
    selectedCountryId = widget.selectedCountryId;
    fetchCountriesData();
  }

  Future<void> fetchCountriesData() async {
    final String apiUrl =
        'https://dyvoltapi.programmerbandung.my.id/api/country';
    final String token = '151|68n4wIDfOnwvjr3SzICQnpmDmrNcCShPUPJKi6oZ';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'enabled': '1',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          countriesData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
        // Tampilkan pesan kesalahan atau lakukan handling sesuai kebutuhan Anda
      }
    } catch (e) {
      print('Error: $e');
      // Tampilkan pesan kesalahan atau lakukan handling sesuai kebutuhan Anda
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 16,
            // ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.inputBorder),
              borderRadius: BorderRadius.circular(6),
              color: AppColors.whiteColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('Pilih Negara'),
                    value: selectedCountryId,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    underline: Container(),
                    icon: null,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    iconSize: 8,
                    items: countriesData.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['countryId'].toString(),
                        child: Text(country['countryName']),
                      );
                    }).toList(),
                    onChanged: (selectedId) {
                      setState(() {
                        selectedCountryId = selectedId;
                      });
                      print('Negara terpilih: $selectedId');
                      widget.onCountrySelected(
                          selectedId); // Panggil callback saat negara dipilih
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: const CustomIcon(
                    iconName: 'icon_arrow_down',
                    size: 24,
                    color: AppColors.inputBorder,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//
//
//

class ProvinceDropdown extends StatefulWidget {
  final String selectedProvinceId;
  final void Function(String?)
      onProvinceSelected; // Tambahkan parameter untuk callback
  final String? selectedCountryId;

  ProvinceDropdown(
      {required this.selectedProvinceId,
      required this.selectedCountryId,
      required this.onProvinceSelected});

  @override
  _ProvinceDropdownState createState() => _ProvinceDropdownState();
}

class _ProvinceDropdownState extends State<ProvinceDropdown> {
  List<Map<String, dynamic>> provincesData = [];
  String? selectedProvinceId; // Tipe diubah menjadi nullable
  String? selectedCountryId; // Tipe diubah menjadi nullable
  // String? selectedProvinceId;

  @override
  void initState() {
    super.initState();
    selectedCountryId = widget.selectedCountryId;
    selectedProvinceId = widget.selectedProvinceId;
    fetchProvinceData();
  }

  @override
  void didUpdateWidget(
    covariant ProvinceDropdown oldWidget,
  ) {
    if (widget.selectedCountryId != oldWidget.selectedCountryId) {
      fetchProvinceData();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> fetchProvinceData() async {
    final String apiUrl =
        'https://dyvoltapi.programmerbandung.my.id/api/province';
    final String token = '151|68n4wIDfOnwvjr3SzICQnpmDmrNcCShPUPJKi6oZ';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'enabled': '1',
          'countryId': widget.selectedCountryId ?? '',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          provincesData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        print(
            'Province Request failed with status: ${response.statusCode}. ${json.decode(response.body)}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      // ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder),
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              hint: Text('Pilih Provinsi'),
              value: selectedProvinceId,
              padding: EdgeInsets.symmetric(horizontal: 16),
              underline: Container(),
              icon: null,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              iconSize: 8,
              items: provincesData.map((country) {
                return DropdownMenuItem<String>(
                  value: country['provinceId'].toString(),
                  child: Text(country['provinceName']),
                );
              }).toList(),
              onChanged: (selectedId) {
                setState(() {
                  selectedProvinceId = selectedId;
                });
                print('Provinsi terpilih: $selectedId');
                widget.onProvinceSelected(
                    selectedId); // Panggil callback saat negara dipilih
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.inputBorder,
            ),
          ),
        ],
      ),
    );
  }
}

//
//
//
class CityDropdown extends StatefulWidget {
  final String selectedCityId;
  final void Function(String?)
      onCitySelected; // Tambahkan parameter untuk callback
  final String? selectedCountryId;
  final String? selectedProvinceId;

  CityDropdown({
    required this.selectedCityId,
    required this.selectedCountryId,
    required this.selectedProvinceId,
    required this.onCitySelected,
  });
  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  List<Map<String, dynamic>> citiesData = [];
  String? selectedCityId; // Tipe diubah menjadi nullable
  String? selectedCountryId; // Tipe diubah menjadi nullable
  String? selectedProvinceId; // Tipe diubah menjadi nullable

  @override
  void initState() {
    super.initState();
    selectedCountryId = widget.selectedCountryId;
    selectedProvinceId = widget.selectedProvinceId;
    selectedCityId = widget.selectedCityId;
    fetchCitiesData();
  }

  @override
  void didUpdateWidget(covariant CityDropdown oldWidget) {
    if (
        // widget.selectedCountryId != oldWidget.selectedCountryId &&
        widget.selectedProvinceId != oldWidget.selectedProvinceId) {
      // widget.selectedCountryId = selectedCountryId;
      // widget.selectedProvinceId = selectedProvinceId;
      // widget.selectedCityId = selectedCityId;
      selectedCityId = null;
      citiesData = [];
      fetchCitiesData();
    }
    // print("Tes");
    super.didUpdateWidget(oldWidget);
  }

  Future<void> fetchCitiesData() async {
    final String apiUrl = 'https://dyvoltapi.programmerbandung.my.id/api/city';
    final String token = '151|68n4wIDfOnwvjr3SzICQnpmDmrNcCShPUPJKi6oZ';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'enabled': '1',
          'countryId': widget.selectedCountryId ?? '',
          'provinceId': widget.selectedProvinceId ?? '',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          citiesData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        print(
            'City Request failed with status: ${response.statusCode}. ${json.decode(response.body)}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      // ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder),
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              hint: Text('Pilih Kota/Kabupaten'),
              value: selectedCityId,
              padding: EdgeInsets.symmetric(horizontal: 16),
              underline: Container(),
              icon: null,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              iconSize: 8,
              items: citiesData.map((city) {
                return DropdownMenuItem<String>(
                  value: city['cityId'].toString(),
                  child: Text(city['cityName']),
                );
              }).toList(),
              onChanged: (selectedId) {
                setState(() {
                  selectedCityId = selectedId;
                });
                print('Kota/Kabupaten Terpilih: $selectedId');
                widget.onCitySelected(selectedId);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.inputBorder,
            ),
          ),
        ],
      ),
    );
  }
}

//
//
//
class DistrictDropdown extends StatefulWidget {
  final String selectedDistrictId;
  final void Function(String?)
      onDistrictSelected; // Tambahkan parameter untuk callback
  final String? selectedCountryId;
  final String? selectedProvinceId;
  final String? selectedCityId;

  DistrictDropdown({
    required this.selectedDistrictId,
    required this.selectedCountryId,
    required this.selectedProvinceId,
    required this.selectedCityId,
    required this.onDistrictSelected,
  });
  @override
  _DistrictDropdownState createState() => _DistrictDropdownState();
}

class _DistrictDropdownState extends State<DistrictDropdown> {
  List<Map<String, dynamic>> districtsData = [];
  String? selectedDistrictId; // Tipe diubah menjadi nullable

  @override
  void initState() {
    super.initState();
    // selectedCountryId = widget.selectedCountryId;
    // selectedProvinceId = widget.selectedProvinceId;
    // selectedCityId = widget.selectedCityId;
    selectedDistrictId = widget.selectedDistrictId;
    fetchDistrictData();
  }

  @override
  void didUpdateWidget(
    covariant DistrictDropdown oldWidget,
  ) {
    if (widget.selectedCityId != oldWidget.selectedCityId ||
        widget.selectedProvinceId != oldWidget.selectedProvinceId) {
      selectedDistrictId = null;
      districtsData = [];
      fetchDistrictData();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> fetchDistrictData() async {
    final String apiUrl =
        'https://dyvoltapi.programmerbandung.my.id/api/district';
    final String token = '151|68n4wIDfOnwvjr3SzICQnpmDmrNcCShPUPJKi6oZ';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'enabled': '1',
          'countryId': widget.selectedCountryId ?? '',
          'provinceId': widget.selectedProvinceId ?? '',
          'cityId': widget.selectedCityId ?? '',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          districtsData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        print(
            'District Request failed with status: ${response.statusCode}. ${json.decode(response.body)}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      // ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder),
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              hint: Text('Pilih Kecamatan'),
              value: selectedDistrictId,
              padding: EdgeInsets.symmetric(horizontal: 16),
              underline: Container(),
              icon: null,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              iconSize: 8,
              items: districtsData.map((district) {
                return DropdownMenuItem<String>(
                  value: district['districtId'].toString(),
                  child: Text(district['districtName']),
                );
              }).toList(),
              onChanged: (selectedId) {
                setState(() {
                  selectedDistrictId = selectedId;
                });
                print('Kecamatan Terpilih: $selectedId');
                widget.onDistrictSelected(selectedId);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.inputBorder,
            ),
          ),
        ],
      ),
    );
  }
}
//
//
//

class AreaDropdown extends StatefulWidget {
  final String selectedAreaId;
  final void Function(String?)
      onAreaSelected; // Tambahkan parameter untuk callback
  final String? selectedCountryId;
  final String? selectedProvinceId;

  final String? selectedCityId;
  final String? selectedDistrictId;

  AreaDropdown({
    required this.selectedAreaId,
    required this.selectedCountryId,
    required this.selectedProvinceId,
    required this.selectedCityId,
    required this.selectedDistrictId,
    required this.onAreaSelected,
  });

  @override
  _AreaDropdownState createState() => _AreaDropdownState();
}

class _AreaDropdownState extends State<AreaDropdown> {
  List<Map<String, dynamic>> areasData = [];
  String? selectedAreaId; // Tipe diubah menjadi nullable

  @override
  void initState() {
    super.initState();
    // selectedCountryId = widget.selectedCountryId;
    // selectedProvinceId = widget.selectedProvinceId;
    // selectedCityId = widget.selectedCityId;
    // selectedDistrictId = widget.selectedDistrictId;
    selectedAreaId = widget.selectedAreaId;
    fetchAreaData();
  }

  @override
  void didUpdateWidget(
    covariant AreaDropdown oldWidget,
  ) {
    if (widget.selectedDistrictId != oldWidget.selectedDistrictId ||
        widget.selectedCityId != oldWidget.selectedCityId ||
        widget.selectedProvinceId != oldWidget.selectedProvinceId) {
      selectedAreaId = null;
      areasData = [];
      fetchAreaData();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> fetchAreaData() async {
    final String apiUrl = 'https://dyvoltapi.programmerbandung.my.id/api/area';
    final String token = '151|68n4wIDfOnwvjr3SzICQnpmDmrNcCShPUPJKi6oZ';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'enabled': '1',
          'countryId': widget.selectedCountryId ?? '',
          'provinceId': widget.selectedProvinceId ?? '',
          'cityId': widget.selectedCityId ?? '',
          'districtId': widget.selectedDistrictId ?? '',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          areasData = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        print(
            'Area Request failed with status: ${response.statusCode}. ${json.decode(response.body)}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      // ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder),
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              hint: Text('Pilih Area'),
              value: selectedAreaId,
              padding: EdgeInsets.symmetric(horizontal: 16),
              underline: Container(),
              icon: null,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              iconSize: 8,
              items: areasData.map((area) {
                return DropdownMenuItem<String>(
                  value: area['areaId'].toString(),
                  child: Text(area['areaName']),
                );
              }).toList(),
              onChanged: (selectedId) {
                setState(() {
                  selectedAreaId = selectedId;
                });
                print('Area Terpilih: $selectedId');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: const CustomIcon(
              iconName: 'icon_arrow_down',
              size: 24,
              color: AppColors.inputBorder,
            ),
          ),
        ],
      ),
    );
  }
}
