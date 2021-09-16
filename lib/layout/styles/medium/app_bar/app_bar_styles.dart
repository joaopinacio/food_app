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

  /// ## AppBarStyles.leftAndRightIcon
  ///
  /// __[leftIcon]__ Widget ao lado esquerdo
  ///
  /// __[onTapLeft]__ Function Tap do icone esquerdo
  ///
  /// __[rightIcon]__ Lista de Icones ao lado direito
  ///
  /// __[onTapRight]__ Function Tap do icone direito
  ///
  /// __[iconsColor]__ Cores dos icones
  ///
  static AppBarComponent leftAndRightIcon({
    required IconData leftIcon,
    Function()? onTapLeft,
    required IconData rightIcon,
    Function()? onTapRight,
    Color? iconsColor,
  }) =>
      AppBarComponent(
        title: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: onTapLeft,
            child: Icon(
              leftIcon,
              size: 24.sp,
              color: iconsColor ?? AppThemes.colors.black,
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
                color: iconsColor ?? AppThemes.colors.black,
              ),
            ),
          ),
        ],
      );

  /// ## AppBarStyles.searchWithReturn
  ///
  /// __[onTapReturn]__ Function Tap para voltar a pagina
  ///
  /// __[onTapSearch]__ Function Tap do icone de pesquisar
  ///
  /// __[iconsColor]__ Cores dos icones
  ///
  static AppBarComponent searchWithReturn({
    required Function() onTapReturn,
    required Function() onTapSearch,
    Color? iconsColor,
  }) =>
      AppBarComponent(
        title: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: onTapReturn,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24.sp,
              color: iconsColor ?? AppThemes.colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: GestureDetector(
              onTap: onTapSearch,
              child: Icon(
                Icons.search,
                size: 24.sp,
                color: iconsColor ?? AppThemes.colors.black,
              ),
            ),
          ),
        ],
      );
}
