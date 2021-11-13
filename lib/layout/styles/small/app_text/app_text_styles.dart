import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/small/app_text/app_text_component.dart';

class AppTextStyles {
  AppTextStyles._();

  /// ## AppTextStyles standard
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textStyle]__ Estilo do texto a ser exibido
  ///
  /// __[color]__ Cor do texto a ser exibido
  ///
  /// __[margin]__ Margin do container do texto
  ///
  /// __[maxLines]__ Numero maximo de linhas do texto
  ///
  /// __[overflow]__ Tipo de soprepor texto dependendo do espaço livre
  ///
  /// __[textAlign]__ Tipo de Alinhamento do texto a ser exibido
  static AppTextComponent standard({
    required String text,
    EdgeInsets? margin,
    int? maxLines,
    TextStyle? textStyle,
    Color? color,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      AppTextComponent(
        text: text,
        margin: margin,
        maxLines: maxLines,
        textStyle: textStyle,
        color: color,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// ## AppTextStyles light_8
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent light_8({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    bool lineThrough = false,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsLight_8,
        textAlign: textAlign,
        margin: margin,
        color: color,
        lineThrough: lineThrough,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles light_12
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent light_12({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsLight_12,
        textAlign: textAlign,
        margin: margin,
      );

  /// ## AppTextStyles regular_12
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent regular_10({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsRegular_12,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles regular_12
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent regular_12({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsRegular_12,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles regular_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent regular_14({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsRegular_14,
        textAlign: textAlign,
        margin: margin,
      );

  /// ## AppTextStyles regular_18
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent regular_16({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsRegular_16,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles regular_18
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent regular_18({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsRegular_18,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles medium_16
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent medium_16({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsMedium_16.copyWith(
          fontSize: fontSize?.sp ?? 16.sp,
        ),
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles medium_10
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent medium_10({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsMedium_10,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles medium_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent medium_12({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsMedium_12,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles medium_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent medium_14({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsMedium_14,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles semiBold_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent semiBold_18({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsSemiBold_18,
        textAlign: textAlign,
        margin: margin,
        color: color,
        overflow: overflow,
      );

  /// ## AppTextStyles semiBold_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent semiBold_14({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsSemiBold_14,
        textAlign: textAlign,
        margin: margin,
        color: color,
        overflow: overflow,
      );

  /// ## AppTextStyles semiBold_12
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent semiBold_12({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsSemiBold_12,
        textAlign: textAlign,
        margin: margin,
        color: color,
      );

  /// ## AppTextStyles semiBold_10
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent semiBold_10({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsSemiBold_10,
        textAlign: textAlign,
        margin: margin,
        color: color,
      );

  /// ## AppTextStyles semiBold_8
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent semiBold_8({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsSemiBold_8,
        textAlign: textAlign,
        margin: margin,
        color: color,
      );

  /// ## AppTextStyles bold_14
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent bold_14({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsBold_14,
        textAlign: textAlign,
        margin: margin,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles bold_20
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent bold_18({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsBold_18,
        textAlign: textAlign,
        margin: margin,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// ## AppTextStyles bold_24
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent bold_24({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
    int? maxLines,
    TextOverflow? overflow,
    Color? color,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsBold_24,
        textAlign: textAlign,
        margin: margin,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
      );

  /// ## AppTextStyles bold_36
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent bold_36({
    required String text,
    TextAlign? textAlign,
    EdgeInsets? margin,
  }) =>
      AppTextComponent(
        text: text,
        textStyle: AppThemes.typography.poppinsBold_36,
        textAlign: textAlign,
        margin: margin,
      );
}
