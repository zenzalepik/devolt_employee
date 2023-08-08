import 'package:blur/blur.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/bottom_navigationbar.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:dyvolt_employee/widgets/fab_menu_pop_up.dart';
import 'package:dyvolt_employee/widgets/presensi_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LemburPengajuanContent extends StatelessWidget {
  const LemburPengajuanContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                            child: Text('Pengajuan Lembur Kerja',
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
                                                child: Text('Tipe Lembur',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        DropdownWhiteW(
                                          labelText: 'Pilih Tipe Lembur',
                                          items: const [
                                            'Lembur Hari Kerja',
                                            'Lembur Hari Libur',
                                          ],
                                          onChanged: (value) {
                                            print('Selected option: $value');
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Jenis Lembur',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        DropdownWhiteW(
                                          labelText: 'Pilih Jenis Lembur',
                                          items: const [
                                            'Reguler',
                                            'Event',
                                          ],
                                          onChanged: (value) {
                                            print('Selected option: $value');
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Tanggal Lembur',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        DateInputW(
                                          labelText: '12 - August - 2022',
                                          onChanged: (String SelectedDate) {
                                            print(
                                                'Selected Date: $SelectedDate');
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Mulai Lembur',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(children: [
                                          Expanded(
                                            child: ClockInputW(
                                              labelText: '',
                                              onChanged: (value) {
                                                // Lakukan sesuatu dengan nilai waktu yang dimasukkan
                                                print('Selected Time: $value');
                                              },
                                            ),
                                          )
                                        ]),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Selesai Lembur',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(children: [
                                          Expanded(
                                            child: ClockInputW(
                                              labelText: '',
                                              onChanged: (value) {
                                                // Lakukan sesuatu dengan nilai waktu yang dimasukkan
                                                print('Selected Time: $value');
                                              },
                                            ),
                                          )
                                        ]),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Lengkapi formulir diatas untuk melakukan lembur kerja',
                                                  style:
                                                      TextStyles.text12px300()),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            child: ButtonMedium(
                          labelText: 'Save',
                          onPressed: () {},
                        ))
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
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AppBarBack(
            labelText: 'Lembur Kerja',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

class LemburPengajuan extends StatefulWidget {
  const LemburPengajuan({super.key});

  @override
  _LemburPengajuanState createState() => _LemburPengajuanState();
}

class _LemburPengajuanState extends State<LemburPengajuan> {
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
    const LemburPengajuanContent(),
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
