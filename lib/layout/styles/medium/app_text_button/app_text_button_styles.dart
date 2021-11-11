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
    bool hasBounce = false,
    double? width,
    double? height,
    bool? isStretched,
    Color? foregroundColor,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        onPressed: onTap,
        isStretched: isStretched ?? true,
        height: height ?? 50,
        textStyle: AppThemes.typography.poppinsBold_14,
        showIconNext: showIconNext,
        padding: padding,
        margin: margin,
        hasBounce: hasBounce,
        width: width,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
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
    double? height,
    bool hasBounce = false,
    TextStyle? textStyle,
    Color? color,
  }) =>
      AppTextButtonComponent(
        label: label ?? '',
        onPressed: onTap,
        height: height ?? 50,
        width: width ?? 280,
        borderRadius: BorderRadius.all(Radius.circular(36.r)),
        textStyle: textStyle ?? AppThemes.typography.poppinsBold_18,
        backgroundColor: color ?? AppThemes.colors.black,
        showIconNext: showIconNext,
        padding: padding,
        margin: margin,
        hasBounce: hasBounce,
      );
}
