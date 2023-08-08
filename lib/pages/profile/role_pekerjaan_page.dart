import 'dart:convert';
import 'dart:io';
import 'package:dyvolt_employee/main_page.dart';
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

class RolePekerjaanPage extends StatefulWidget {
  const RolePekerjaanPage({super.key});

  @override
  State<RolePekerjaanPage> createState() => _RolePekerjaanPageState();
}

class _RolePekerjaanPageState extends State<RolePekerjaanPage> {
  String? selectedValue;
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
                                            child: Text('Role',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Pilih Role Pekerjaan', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                 
                                    SizedBox(height: 18),   Row(
                                      children: [
                                        Expanded(
                                            child: Text('Divisi Pekerjaan',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Pilih Divisi Pekerjaan', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('Posisi Pekerjaan',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Pilih Posisi Pekerjaan ', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('Cabang Kantor',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Cab. Bandung', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('Tipe User',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Karyawan', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('kategori Karyawan',
                                                style: TextStyles.text12px600(
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownOutlineW(
                                      labelText: 'Staff B (Bengkel)', // Label untuk dropdown
                                      items: [
                                        'Item 1',
                                        'Item 2',
                                        'Item 3'
                                      ], // Daftar item yang akan ditampilkan
                                      onChanged: (value) {
                                        // Ketika nilai dropdown berubah
                                        // Anda bisa mengubah state di sini atau melakukan hal lainnya
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
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
                                            onPressed: () {},
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
                  labelText: 'Pengaturan',
                  onBack: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        }));
  }
}
