import 'dart:convert';
import 'dart:io';
import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/pages/profile/data_rekening_page.dart';
import 'package:dyvolt_employee/pages/profile/personal_data_page.dart';
import 'package:dyvolt_employee/pages/profile/role_pekerjaan_page.dart';
import 'package:dyvolt_employee/pages/profile/ubah_katasandi_page.dart';
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

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
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
                      height: 32 + 40 - 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PersonalDataPage(),
                                                  ));
                                            },
                                            child: Column(children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Personal Data',
                                                        style: TextStyles
                                                            .text20px600(
                                                                color: AppColors
                                                                    .blackColor)),
                                                  ),
                                                  const CustomIcon(
                                                    iconName:
                                                        'icon_setting_profil',
                                                    color: AppColors.blackColor,
                                                  ),
                                                ],
                                              )
                                            ]),
                                          ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DataRekeningPage(),
                                                  ));
                                            },
                                            child: Column(children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Data Rekening',
                                                        style: TextStyles
                                                            .text20px600(
                                                                color: AppColors
                                                                    .blackColor)),
                                                  ),
                                                  const CustomIcon(
                                                    iconName:
                                                        'icon_setting_payment',
                                                    color: AppColors.blackColor,
                                                  ),
                                                ],
                                              )
                                            ]),
                                          ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RolePekerjaanPage(),
                                                    ));
                                              },
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          'Role Pekerjaan',
                                                          style: TextStyles
                                                              .text20px600(
                                                                  color: AppColors
                                                                      .blackColor)),
                                                    ),
                                                    const CustomIcon(
                                                      iconName:
                                                          'icon_setting_work',
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ],
                                                )
                                              ]),
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
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const UbahKataSandiPage(),
                                                    ));
                                              },
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          'Ubah Password',
                                                          style: TextStyles
                                                              .text20px600(
                                                                  color: AppColors
                                                                      .blackColor)),
                                                    ),
                                                    const CustomIcon(
                                                      iconName:
                                                          'icon_setting_password',
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ],
                                                )
                                              ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
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
