import 'package:flutter/material.dart';
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
}
