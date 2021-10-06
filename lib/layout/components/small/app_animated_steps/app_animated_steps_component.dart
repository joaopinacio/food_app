import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppAnimatedStepsComponent extends StatelessWidget {
  final double size;
  final double groupWidth;
  final int duration;
  final double? goTo;

  const AppAnimatedStepsComponent({
    required this.size,
    required this.groupWidth,
    required this.duration,
    this.goTo = 0,
  });

  @override
  Widget build(BuildContext context) {
    double position = goTo == 1
        ? 25
        : goTo == 2
            ? 50
            : 0;

    return Container(
      width: groupWidth.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                color: AppThemes.colors.generalRed_25,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                color: AppThemes.colors.generalRed_25,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                color: AppThemes.colors.generalRed_25,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: duration),
            curve: Curves.fastLinearToSlowEaseIn,
            left: position,
            child: Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                color: AppThemes.colors.generalRed,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
