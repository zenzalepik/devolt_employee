import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle textClock({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 48, // Ukuran font dalam piksel
      fontFamily: 'Inter', // Jenis font
      fontStyle: FontStyle.normal, // Gaya font (normal, italic)
      fontWeight: FontWeight.w600,
      wordSpacing: -8,
    );
  }

  static TextStyle textSplashScreen({Color color = AppColors.whiteColor}) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.48,
    );
  }

  static TextStyle textGoodMorning({Color color = AppColors.whiteColor}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textInputActive({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.4,
      letterSpacing: 0.2,
    );
  }

  static TextStyle textLabelInput({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
  }

  static TextStyle textPlaceholderInput({Color color = AppColors.grey70Color}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.4,
      letterSpacing: 0.2,
    );
  }
  static TextStyle text24px600({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text22px500({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 22,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: -1,
      height: 1.45,
    );
  }

  static TextStyle textLink({Color color = AppColors.primaryColor}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.45,
    );
  }

  static TextStyle textButton({Color color = AppColors.whiteColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
  }

  static TextStyle textAppBar({Color color = AppColors.whiteColor}) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle textTitleSection({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle text20px600({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 20,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text18px400({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle text18px600({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text16px800({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle text16px700({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle text16px600({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text16px300({Color color = AppColors.blackColor}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle text15px500({Color color = AppColors.grey63Color}) {
    return TextStyle(
      color: color,
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle text14px600({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text14px500({Color color = AppColors.grey2EColor}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle text12px600({Color color = AppColors.primaryColor}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text12px500({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle text12px400({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle text12px300({Color color = AppColors.greyBlackColor}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle text10px400({Color color = AppColors.grey63Color}) {
    return TextStyle(
      color: color,
      fontSize: 10,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle text8px400({Color color = AppColors.grey63Color}) {
    return TextStyle(
      color: color,
      fontSize: 10,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }
}
