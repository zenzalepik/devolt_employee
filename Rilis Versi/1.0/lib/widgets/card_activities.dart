import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardActivitiesWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final String whatCard;
  final String textValue;
  final String textTitle;
  final VoidCallback onTap;

  const CardActivitiesWidget({
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: whatCard == 'performa'
              ? AppColors.greyD6Color
              : whatCard == 'hadir'
                  ? AppColors.bgGreen
                  : whatCard == 'izin'
                      ? AppColors.bgOrange
                      : whatCard == 'sakit'
                          ? AppColors.bgPink
                          : AppColors.blackColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    textTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.text14px600(),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset(
                  whatCard == 'performa'
                      ? 'assets/images/img_activ_performa.svg'
                      : whatCard == 'hadir'
                          ? 'assets/images/img_activ_hadir.svg'
                          : whatCard == 'izin'
                              ? 'assets/images/img_activ_izin.svg'
                              : whatCard == 'sakit'
                                  ? 'assets/images/img_activ_sakit.svg'
                                  : 'assets/images/icons/icon_close',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(textValue,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.text14px500(
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
