import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppTypography {
  static const _letterSpacing = 0.0;

  // Bold
  TextStyle get poppinsBold_36 => TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );

  TextStyle get poppinsBold_30 => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );

  TextStyle get poppinsBold_14 => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );

  // SemiBold
  TextStyle get poppinsSemiBold_12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
      );

  TextStyle get poppinsSemiBold_14 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
      );

  // Regular
  TextStyle get poppinsRegular_12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );

  TextStyle get poppinsRegular_16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );
}
