import 'package:flutter/material.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_modal_bottom_sheet/app_modal_bottom_sheet_styles.dart';
import 'package:food_app/pages/restaurant_menu/mixins/restaurant_menu_animations.dart';
import 'package:get/get.dart';

class RestaurantMenuPageController extends GetxController with RestaurantMenuAnimations, SingleGetTickerProviderMixin {
  RestaurantMenuPageController();

  var mainColor = AppThemes.colors.black;

  @override
  void onInit() {
    initAnimation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    AppModalBottomSheetStyles.standard(title: 'a');
  }

  initAnimation() {
    appBarIconsColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    appBarIconsColorAnim =
        ColorTween(begin: AppThemes.colors.white, end: AppThemes.colors.black).animate(appBarIconsColorController);

    checkLuminanceColor(mainColor);
  }

  @override
  void onClose() {
    appBarIconsColorController.dispose();
    super.onClose();
  }
}
