import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';

class ArrowMenuW extends StatelessWidget {
  final String labelText;
  final VoidCallback onTap;
  const ArrowMenuW({
    Key? key,
    this.labelText = '',
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Text(labelText,
                  style: TextStyles.text20px600(color: AppColors.whiteColor)),
            ),
            const CustomIcon(
              iconName: 'icon_arrow',
              color: AppColors.whiteColor,
            ),
          ],
        )
      ]),
    );
  }
}
