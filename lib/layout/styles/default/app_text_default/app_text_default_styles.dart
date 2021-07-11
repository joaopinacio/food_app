import 'package:food_app/layout/components/default/app_text_default_component.dart';
import 'package:flutter/material.dart';

class AppTextDefaultStyles {
  AppTextDefaultStyles._();

  /// ## AppTextDefaultStyles  standard
  ///
  /// __[text]__ Texto a ser Exibido
  ///
  static AppTextDefaultComponent standard({
    required String text,
  }) =>
      AppTextDefaultComponent(
        text: text,
        color: Colors.black54,
      );

  /// ## AppTextDefaultStyles  standard
  ///
  /// __[text]__ Texto a ser Exibido
  ///
  static AppTextDefaultComponent redText({
    required String text,
  }) =>
      AppTextDefaultComponent(
        text: text,
        color: Colors.red,
      );
}
