import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

mixin RestaurantMenuAnimations on GetxController {
  late AnimationController appBarIconsColorController;
  late Animation<Color?> appBarIconsColorAnim;
  var mainAppBarIconsColor;

  var mainContainerHeight = 550.0.obs;
  var mainContainerBorder = BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r)).obs;
  var mainImageOpacity = 1.0.obs;
  var cartIconColor = AppThemes.colors.white;

  double get getMainContainerHeight => mainContainerHeight.value;
  BorderRadius get getMainContainerBorder => mainContainerBorder.value;
  double get getMainImageOpacity => mainImageOpacity.value;
  Color? get getAppBarIconsColorAnim => appBarIconsColorAnim.value;

  bool onNotifyScroll(ScrollNotification notification) {
    if (notification.metrics.pixels >= 100 && notification.metrics.axis == Axis.vertical) {
      mainContainerHeight.value = 700.0;
      mainContainerBorder.value = BorderRadius.zero;
      appBarIconsColorController.forward();
      mainImageOpacity.value = 0;
    } else if (notification.metrics.axis == Axis.vertical) {
      mainContainerHeight.value = 550.0;
      mainContainerBorder.value = BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r));
      checkCurrentColor();
    }
    return true;
  }

  checkCurrentColor() {
    if (mainAppBarIconsColor == AppThemes.colors.white) {
      appBarIconsColorController.reverse();
    } else {
      appBarIconsColorController.forward();
    }
  }

  onMainContainerEnd() {
    if (getMainContainerHeight == 550) {
      mainImageOpacity.value = 1;
    }
  }

  checkLuminanceColor(Color color) {
    var luminance = AppUtil.checkLuminanceColor(color);

    if (luminance < 0.5) {
      appBarIconsColorController.reverse();
      mainAppBarIconsColor = AppThemes.colors.white;
      cartIconColor = AppThemes.colors.white;
    } else {
      appBarIconsColorController.forward();
      mainAppBarIconsColor = AppThemes.colors.black;
      cartIconColor = AppThemes.colors.black;
    }
  }
}
