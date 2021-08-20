import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

class AppLoading {
  static loading() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return SpinKitFoldingCube(
          color: AppThemes.colors.primaryColor,
        );
      },
    );
  }
}
