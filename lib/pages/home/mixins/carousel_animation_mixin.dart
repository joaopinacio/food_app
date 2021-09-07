import 'package:flutter/material.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:get/get.dart';

mixin CarouselAnimationMixin on GetxController {
  var pastIndex = 0;
  var forward = true;
  var restaurantList = <RestaurantModel>[].obs;
  var colorAnim;
  late AnimationController colorController;

  void onPageChanged(int index, reason) {
    var restaurantColor = Color(int.parse(restaurantList[index].primaryColor.replaceAll('#', '0xff')));
    var pastRestaurantColor = Color(int.parse(restaurantList[pastIndex].primaryColor.replaceAll('#', '0xff')));

    if (forward) {
      colorAnim = ColorTween(begin: restaurantColor, end: pastRestaurantColor).animate(colorController);
      colorController.reverse();
      forward = false;
    } else {
      colorAnim = ColorTween(begin: pastRestaurantColor, end: restaurantColor).animate(colorController);
      colorController.forward();
      forward = true;
    }
    pastIndex = index;
  }
}
