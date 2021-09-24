import 'package:flutter/material.dart';
import 'package:food_app/layout/components/medium/app_modal_bottom_sheet/app_modal_bottom_sheet_component.dart';

class AppModalBottomSheetStyles {
  AppModalBottomSheetStyles._();

  /// ## AppModalBottomSheetStyles
  ///
  /// __[a]__ a
  ///
  static standard({
    required String title,
  }) =>
      showModalBottomSheetComponent(
        child: Container(
          height: 100,
          child: Center(
            child: Text(title),
          ),
        ),
      );
}
