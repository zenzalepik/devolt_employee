import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String iconName;
  final double size;
  final Color? color;

  const CustomIcon({super.key, 
    required this.iconName,
    this.size = 24.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final String iconPath = 'assets/icons/$iconName.svg';
    return SvgPicture.asset(
      iconPath,
      width: size,
      height: size,
      color: color,
    );
  }
}
