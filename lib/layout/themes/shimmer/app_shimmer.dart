import 'package:food_app/layout/app_layout_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer {
  static final highlightColor = AppThemes.colors.white;
  static final baseColor = AppThemes.colors.grayScale_1;

  standard({required Widget child}) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: child,
      );

  rectangle({
    required double height,
    required double width,
    double? borderRadius,
    EdgeInsets? margin,
  }) =>
      Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: Container(
          height: height,
          width: width,
          margin: margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular((borderRadius ?? 0).r)),
            color: AppThemes.colors.white,
          ),
        ),
      );

  circle({required double size}) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          height: size.sp,
          width: size.sp,
        ),
      );
}
