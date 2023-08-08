import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';

class CardAnaouncementWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final VoidCallback onTap;

  const CardAnaouncementWidget({
    Key? key,
    this.bgColor = AppColors.bgRed,
    this.labelColor = AppColors.labelErrorColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text('Libur Kerja selama 3 hari selama idul Adha',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.text16px700()),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Due date', style: TextStyles.text12px400()),
                  Row(
                    children: [
                      const CustomIcon(
                          iconName: 'icon_calendar',
                          size: 12,
                          color: AppColors.iconColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'July 23, 2022',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.text12px500(),
                      )
                    ],
                  )
                ])
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 14,
            child: Container(
              height: 28,
              width: 4,
              decoration: BoxDecoration(
                color: labelColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
