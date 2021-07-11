import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppTypography {
  static const _letterSpacing = 0.0;

  // Bold
  TextStyle get poppinsBold_30 => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        color: AppThemes.colors.black,
        letterSpacing: _letterSpacing,
        fontFamily: 'Poppins',
      );
}
