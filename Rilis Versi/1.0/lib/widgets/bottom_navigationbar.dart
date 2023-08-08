import 'package:dyvolt_employee/main_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: BottomAppBar(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            clipBehavior: Clip.antiAlias,
            height: 48,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: Container(),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: const CustomIcon(
                    iconName: 'icon_home',
                    color: AppColors.blackColor,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(selectedIndex: 0),
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: const CustomIcon(
                    iconName: 'icon_work',
                    color: AppColors.blackColor,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(selectedIndex: 1),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 48), // Mengisi ruang untuk notch
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: const CustomIcon(
                    iconName: 'icon_wallet',
                    color: AppColors.blackColor,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(selectedIndex: 2),
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: const CustomIcon(
                    iconName: 'icon_profile',
                    color: AppColors.blackColor,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(selectedIndex: 3),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
