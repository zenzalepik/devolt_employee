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

class ReimbursPengajuanContent extends StatelessWidget {
  const ReimbursPengajuanContent({super.key});

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
                                                child: Text('Nomor Pengajuan',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Expanded(
                                                child: TextInputWhite(
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
                                                    'Keterangan Reimburs',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: TextInputWhite(
                                                hintText:
                                                    'Tulis Keterangan Reimburs',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Pengaju Reimburs',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: TextInputWhite(
                                                hintText:
                                                    'Tulis Pengaju Reimburs',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Tanggal Reimburs',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: DateInputW(
                                                labelText: '12 - August - 2022',
                                                onChanged:
                                                    (String SelectedDate) {
                                                  print(
                                                      'Selected Date: $SelectedDate');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Biaya Realisasi',
                                                    style:
                                                        TextStyles.text12px600(
                                                            color: AppColors
                                                                .blackColor))),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: TextInputWhite(
                                                hintText: 'IDR 0,000,000',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text('Bukti',
                                                    style:
                                                        TextStyles.text12px600(
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
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  if (index == 0) {
                                                    // Item kedua
                                                    return MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.56,
                                                              child: Container(
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
                                                                child: SizedBox(
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
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/izin/sakit/img_izin_sakit_1.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.56,
                                                              child: Container(
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
                                                                child: SizedBox(
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
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Lengkapi formulir diatas untuk melakukan izin kerja',
                                                  style:
                                                      TextStyles.text12px300()),
                                            ),
                                          ],
                                        )
                                        // SizedBox(height: 18),
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
    const ReimbursPengajuanContent(),
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
