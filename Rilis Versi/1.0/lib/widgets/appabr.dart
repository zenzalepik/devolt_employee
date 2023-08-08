import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarHello extends StatelessWidget {
  const AppBarHello({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: 88,
        width: double.infinity,
        color: AppColors.primaryColor,
        child: ClipRect(
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/img_ornament_splash_1.svg',
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good Morning', style: TextStyles.textGoodMorning()),
                  Text('Mohammed Ali', style: TextStyles.textAppBar())
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class AppBarBack extends StatelessWidget {
  final VoidCallback onBack;
  final String labelText;
  const AppBarBack({
    Key? key,
    required this.labelText,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: 104 - 36 + 4,
        width: double.infinity,
        color: AppColors.primaryColor,
        child: ClipRect(
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/img_ornament_splash_1.svg',
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 24, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onBack,
                        child: const CustomIcon(
                          iconName: 'icon_back',
                          size: 24,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          labelText,
                          style: TextStyles.textAppBar(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
