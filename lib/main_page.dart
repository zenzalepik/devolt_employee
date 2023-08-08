import 'package:blur/blur.dart';
import 'package:dyvolt_employee/pages/home_page.dart';
import 'package:dyvolt_employee/pages/profile/profile_page.dart';
import 'package:dyvolt_employee/pages/reimburs/reimburs_page.dart';
import 'package:dyvolt_employee/pages/work/work_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/fab_menu_pop_up.dart';
import 'package:dyvolt_employee/widgets/presensi_pop_up.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int selectedIndex;
  MainPage({required this.selectedIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<bool> visible = ValueNotifier<bool>(false);

  int _selectedIndex = 0;
  int fabOpacity = 1;
  bool fabMenuOpacity = false;
  bool animateOpacity = false;
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

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = [
    HomePage(),
    const WorkPage(),
    const ReimbursPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
        child: AppBarEmptyW(),
      ),
      // appBar: AppBar(title: Text('Bottom Navigation Bar')),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  fabOpacity == 0
                      ? Blur(
                          blur: 20,
                          blurColor: AppColors.blackColor,
                          child: _widgetOptions.elementAt(_selectedIndex),
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
                        visible:
                            fabMenuPresensiOpacity, //fabMenuPresensiOpacity
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
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  SizedBox(
                    child: BottomAppBar(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                        clipBehavior: Clip.antiAlias,
                        height: 48,
                        shape: const CircularNotchedRectangle(),
                        notchMargin: 8,
                        child: Container()),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 8,
                    child: SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: _selectedIndex == 0
                                ? const CustomIcon(
                                    iconName: 'icon_home_filled',
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  )
                                : const CustomIcon(
                                    iconName: 'icon_home',
                                    color: AppColors.blackColor,
                                    size: 24,
                                  ),
                            onPressed: () {
                              _onItemTapped(0);
                              _showFAB();
                            },
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: _selectedIndex == 1
                                ? const CustomIcon(
                                    iconName: 'icon_work_filled',
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  )
                                : const CustomIcon(
                                    iconName: 'icon_work',
                                    color: AppColors.blackColor,
                                    size: 24,
                                  ),
                            onPressed: () {
                              _onItemTapped(1);
                              _showFAB();
                            },
                          ),
                          const SizedBox(
                              width: 48), // Mengisi ruang untuk notch
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: _selectedIndex == 2
                                ? const CustomIcon(
                                    iconName: 'icon_wallet_filled',
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  )
                                : const CustomIcon(
                                    iconName: 'icon_wallet',
                                    color: AppColors.blackColor,
                                    size: 24,
                                  ),
                            onPressed: () {
                              _onItemTapped(2);
                              _showFAB();
                            },
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: _selectedIndex == 3
                                ? const CustomIcon(
                                    iconName: 'icon_profile_filled',
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  )
                                : const CustomIcon(
                                    iconName: 'icon_profile',
                                    color: AppColors.blackColor,
                                    size: 24,
                                  ),
                            onPressed: () {
                              _onItemTapped(3);
                              _showFAB();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
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
