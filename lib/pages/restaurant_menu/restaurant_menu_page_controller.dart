import 'package:flutter/material.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/restaurant_menu/mixins/restaurant_menu_animations.dart';
import 'package:food_app/pages/restaurants/restaurants_page_controller.dart';
import 'package:get/get.dart';

class RestaurantMenuPageController extends GetxController with RestaurantMenuAnimations, SingleGetTickerProviderMixin {
  final RestaurantsPageController _restaurantsPageController;

  RestaurantMenuPageController({required RestaurantsPageController restaurantsPageController})
      : _restaurantsPageController = restaurantsPageController;

  RestaurantsPageController get getRestaurantsPageController => _restaurantsPageController;

  var mainColor = AppThemes.colors.black;

  late RestaurantModel restaurant;

  @override
  void onInit() {
    initAnimation();
    super.onInit();
  }

  initAnimation() {
    restaurant = Get.arguments['restaurant'];
    mainColor = AppUtil.stringColorToColor(restaurant.primaryColor);

    appBarIconsColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    appBarIconsColorAnim =
        ColorTween(begin: AppThemes.colors.white, end: AppThemes.colors.black).animate(appBarIconsColorController);

    checkLuminanceColor(mainColor);
  }

  bool checkUserIsRestaurant() {
    return _restaurantsPageController.user.userType == 'restaurant';
  }

  @override
  void onClose() {
    appBarIconsColorController.dispose();
    super.onClose();
  }
}
