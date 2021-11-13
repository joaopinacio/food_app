import 'package:flutter/material.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

mixin CarouselAnimationMixin on GetxController {
  var pastIndex = 0;
  var forward = true;
  var restaurantList = <RestaurantModel>[].obs;
  var backgroundColorAnim;
  var appBarIconsColorAnim;
  var currentColor;
  late AnimationController backgroundColorController;
  late AnimationController appBarIconsColorController;
  RestaurantModel restaurantSelected = RestaurantModel.init();

  void onPageChanged(int index, reason) {
    restaurantSelected = restaurantList[index];
    var restaurantColor = AppUtil.stringColorToColor(restaurantList[index].primaryColor);
    var pastRestaurantColor = AppUtil.stringColorToColor(restaurantList[pastIndex].primaryColor);

    if (forward) {
      backgroundColorAnim =
          ColorTween(begin: restaurantColor, end: pastRestaurantColor).animate(backgroundColorController);
      checkLuminanceColor(restaurantColor);
      backgroundColorController.reverse();
      currentColor = restaurantColor;
      forward = false;
    } else {
      backgroundColorAnim =
          ColorTween(begin: pastRestaurantColor, end: restaurantColor).animate(backgroundColorController);
      checkLuminanceColor(restaurantColor);
      backgroundColorController.forward();
      currentColor = restaurantColor;
      forward = true;
    }
    pastIndex = index;
  }

  changeBackgroundColorByList() {
    var restaurantColor = AppUtil.stringColorToColor(restaurantList[pastIndex].primaryColor);

    if (forward) {
      backgroundColorAnim = ColorTween(begin: restaurantColor, end: currentColor).animate(backgroundColorController);
      checkLuminanceColor(restaurantColor);
      backgroundColorController.reverse();
      currentColor = restaurantColor;
      forward = false;
    } else {
      backgroundColorAnim = ColorTween(begin: currentColor, end: restaurantColor).animate(backgroundColorController);
      checkLuminanceColor(restaurantColor);
      backgroundColorController.forward();
      currentColor = restaurantColor;
      forward = true;
    }
  }

  checkLuminanceColor(Color color) {
    var luminance = color.computeLuminance();

    if (luminance < 0.5) {
      appBarIconsColorController.reverse();
    } else {
      appBarIconsColorController.forward();
    }
  }
}
