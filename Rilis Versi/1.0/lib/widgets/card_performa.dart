import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';

class CardPerformaWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final String whatCard;
  final String textValue;
  final String textTitle;
  final VoidCallback onTap;

  const CardPerformaWidget({
    Key? key,
    this.bgColor = AppColors.bgRed,
    this.labelColor = AppColors.labelErrorColor,
    this.whatCard = 'performa',
    this.textValue = '',
    this.textTitle = '',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: whatCard == 'performa'
              ? AppColors.bgGrey
              : whatCard == 'hadir'
                  ? AppColors.bgGreen
                  : whatCard == 'izin'
                      ? AppColors.bgOrange
                      : whatCard == 'sakit'
                          ? AppColors.bgPink
                          : AppColors.blackColor,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.05),
          //     offset: Offset(0, 1),
          //     blurRadius: 1,
          //     spreadRadius: 1,
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    textTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textClock(),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CustomIcon(
                    iconName: 'icon_check_list',
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                SizedBox(
                  width: 104,
                  height: 36,
                  child: Text(textValue,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.text16px300(
                          color: whatCard == 'performa'
                              ? AppColors.grey2EColor
                              : whatCard == 'hadir'
                                  ? AppColors.labelSuccessColor
                                  : whatCard == 'izin'
                                      ? AppColors.labelErrorColor
                                      : whatCard == 'sakit'
                                          ? AppColors.labelPinkColor
                                          : AppColors.blackColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
