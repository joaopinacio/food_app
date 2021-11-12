import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPhotoComponent extends StatelessWidget {
  final String filePath;
  final double? size;

  const AppPhotoComponent({
    required this.filePath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.r),
      child: Image.file(
        File(filePath),
        fit: BoxFit.cover,
        width: size?.sp ?? 70.sp,
        height: size?.sp ?? 70.sp,
      ),
    );
  }
}
