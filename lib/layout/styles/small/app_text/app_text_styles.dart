import 'package:flutter/material.dart';
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

  /// ## AppTextStyles standard
  ///
  /// __[text]__ Texto a ser exibido
  ///
  /// __[textAlign]__ Tipo de alinhamento do texto
  ///
  static AppTextComponent bold({
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
