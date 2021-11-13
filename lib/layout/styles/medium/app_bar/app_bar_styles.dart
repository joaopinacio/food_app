import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/medium/app_bar/app_bar_component.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';

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
    bool leftIconVisible = false,
    required IconData rightIcon,
    Function()? onTapRight,
    Color? iconsColor,
  }) =>
      AppBarComponent(
        title: Visibility(
          visible: leftIconVisible,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTapLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 10.h),
              child: Icon(
                leftIcon,
                size: 24.sp,
                color: iconsColor ?? AppThemes.colors.black,
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTapRight,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 10.h),
              child: Icon(
                rightIcon,
                size: 24.sp,
                color: iconsColor ?? AppThemes.colors.black,
              ),
            ),
          ),
        ],
      );

  /// ## AppBarStyles.leftIconWithTitle
  ///
  /// __[leftIcon]__ Widget ao lado esquerdo
  ///
  /// __[onTapLeft]__ Function Tap do icone esquerdo
  ///
  /// __[title]__ Titulo da pagina
  ///
  static AppBarComponent leftIconWithTitle({
    required IconData leftIcon,
    Function()? onTapLeft,
    required String title,
  }) =>
      AppBarComponent(
        title: Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTapLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 15.w, bottom: 10.h),
                child: Icon(
                  leftIcon,
                  size: 24.sp,
                  color: AppThemes.colors.black,
                ),
              ),
            ),
            AppTextStyles.bold_18(
              text: title,
            ),
          ],
        ),
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
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTapReturn,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 10.h),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 24.sp,
              color: iconsColor ?? AppThemes.colors.black,
            ),
          ),
        ),
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTapSearch,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 10.h),
              child: Icon(
                Icons.search,
                size: 24.sp,
                color: iconsColor ?? AppThemes.colors.black,
              ),
            ),
          ),
        ],
      );

  /// ## AppBarStyles.onlyTitleAndBack
  ///
  /// __[title]__ Titulo da Pagina
  ///
  /// __[onTapReturn]__ Function Tap para voltar a pagina
  ///
  static AppBarComponent onlyTitleAndBack({
    required String title,
    required Function() onTapBack,
  }) =>
      AppBarComponent(
        title: Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTapBack,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 15.w, bottom: 10.h),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 20.sp,
                  color: AppThemes.colors.black,
                ),
              ),
            ),
            AppTextStyles.bold_18(
              text: title,
            ),
          ],
        ),
      );

  /// ## AppBarStyles.onlyTitleAndBack
  ///
  /// __[title]__ Titulo da Pagina
  ///
  /// __[onTapReturn]__ Function Tap para voltar a pagina
  ///
  static AppBarComponent onlyTitle({
    required String title,
  }) =>
      AppBarComponent(
        title: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 15.w, bottom: 10.h),
          child: AppTextStyles.bold_18(
            text: title,
          ),
        ),
      );

  /// ## AppBarStyles.titleBackAndRightIcon
  ///
  /// __[title]__ Titulo da Pagina
  ///
  /// __[onTapReturn]__ Function Tap para voltar a pagina
  ///
  /// __[rightIcon]__ Icone da direita
  ///
  /// __[onTapRight]__ Function Tap do icone da direita
  ///
  static AppBarComponent titleBackAndRightIcon({
    required String title,
    required Function() onTapBack,
    required IconData rightIcon,
    required Function() onTapRight,
  }) =>
      AppBarComponent(
        title: Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTapBack,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 15.w, bottom: 10.h),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 20.sp,
                  color: AppThemes.colors.black,
                ),
              ),
            ),
            AppTextStyles.bold_18(
              text: title,
            ),
          ],
        ),
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTapRight,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 10.h),
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
