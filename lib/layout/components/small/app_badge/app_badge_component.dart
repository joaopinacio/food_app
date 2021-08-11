import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBadgeComponent extends StatelessWidget {
  final String assetPath;
  final double size;

  const AppBadgeComponent({
    required this.size,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: size.w,
      height: size.h,
      fit: BoxFit.contain,
    );
  }
}
