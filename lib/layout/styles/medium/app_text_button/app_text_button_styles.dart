import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/medium/app_text_button/app_text_button_component.dart';

class AppTextButtonStyles {
  AppTextButtonStyles._();

  /// ## AppTextButtonStyles.primary
  ///
  /// __[label]__ Texto do Botao
  ///
  /// __[onTap]__ Função a ser executada no clique
  static AppTextButtonComponent primary({
    required Function onTap,
    String? label,
    bool showIconNext = false,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        onPressed: onTap,
        isStretched: true,
        height: 50,
        textStyle: AppThemes.typography.poppinsBold_14,
        showIconNext: showIconNext,
        padding: padding,
        margin: margin,
      );

  /// ## AppTextButtonStyles.link
  ///
  /// __[label]__ Texto do Botao
  ///
  /// __[onTap]__ Função a ser executada no clique
  ///
  static AppTextButtonComponent link({
    String? label,
    required Function onTap,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        onPressed: onTap,
        isStretched: false,
        isOutlined: false,
        textStyle: AppThemes.typography.poppinsSemiBold_14,
        foregroundColor: AppThemes.colors.generalBlue,
        backgroundColor: Colors.transparent,
      );

  /// ## AppTextButtonStyles.linkSmall
  ///
  /// __[label]__ Texto do Botao
  ///
  /// __[onTap]__ Função a ser executada no clique
  ///
  static AppTextButtonComponent linkSmall({
    String? label,
    TextAlign? labelAlign,
    EdgeInsets? padding,
    Color? labelColor,
    required Function onTap,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        height: 25,
        onPressed: onTap,
        isStretched: false,
        isOutlined: false,
        textStyle: AppThemes.typography.poppinsRegular_12,
        foregroundColor: labelColor ?? AppThemes.colors.generalBlue,
        backgroundColor: Colors.transparent,
        labelAlign: labelAlign,
        padding: padding,
      );

  /// ## AppTextButtonStyles.primary
  ///
  /// __[label]__ Texto do Botao
  ///
  /// __[onTap]__ Função a ser executada no clique
  ///
  static AppTextButtonComponent rounded({
    Function? onTap,
    String? label,
    bool showIconNext = false,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    bool hasBounce = false,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        onPressed: onTap,
        height: 50,
        width: width ?? 280,
        borderRadius: BorderRadius.all(Radius.circular(36.r)),
        textStyle: AppThemes.typography.poppinsBold_18,
        backgroundColor: AppThemes.colors.black,
        showIconNext: showIconNext,
        padding: padding,
        margin: margin,
        hasBounce: hasBounce,
      );
}
