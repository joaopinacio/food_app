import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppDefaultPhotoComponent extends StatelessWidget {
  final double? size;

  const AppDefaultPhotoComponent({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.sp ?? 70.sp,
      height: size?.sp ?? 70.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: AppThemes.colors.grayScale_2,
      ),
      child: Center(
        child: Icon(Icons.photo_camera_rounded),
      ),
    );
  }
}
