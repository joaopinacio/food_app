import 'package:flutter/material.dart';
import 'package:food_app/layout/components/small/app_ink_well/app_ink_well_component.dart';

class AppInkWellStyles {
  AppInkWellStyles._();

  /// ## AppInkWellStyles.standard
  ///
  /// __[child]__ Widget filho
  ///
  /// __[onTap]__ Funcao Tap
  ///
  static AppInkWellComponent standard({
    required Widget child,
    Function()? onTap,
  }) =>
      AppInkWellComponent(
        child: child,
        onTap: onTap,
      );
}
