import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/medium/app_bar/app_bar_component.dart';

class AppBarStyles {
  AppBarStyles._();

  /// ## AppBarStyles
  ///
  /// __[title]__ Titulo a ser mostrado
  ///
  /// __[backgroundColor]__ Cor de fundo
  ///
  /// __[leading]__ Widget ao lado esquerdo
  ///
  /// __[actions]__ Lista de Widgets ao lado direito
  ///
  static AppBarComponent standard({
    required Widget title,
    Color? backgroundColor,
    Widget? leading,
    List<Widget>? actions,
  }) =>
      AppBarComponent(
        title: title,
        backgroundColor: backgroundColor,
        leading: leading,
        actions: actions,
      );

  /// ## AppBarStyles.onlyIcons
  ///
  /// __[leftIcons]__ Widget ao lado esquerdo
  ///
  /// __[rightIcons]__ Lista de Icones ao lado direito
  ///
  static AppBarComponent leftAndRightIcon({
    required IconData leftIcon,
    Function()? onTapLeft,
    required IconData rightIcon,
    Function()? onTapRight,
  }) =>
      AppBarComponent(
        title: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: onTapLeft,
            child: Icon(
              leftIcon,
              size: 24.sp,
              color: AppThemes.colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: GestureDetector(
              onTap: onTapRight,
              child: Icon(
                rightIcon,
                size: 24.sp,
                color: AppThemes.colors.black,
              ),
            ),
          ),
        ],
      );
}
