import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_interface.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/restaurant_menu/mixins/restaurant_menu_animations.dart';
import 'package:food_app/pages/restaurants/restaurants_page_controller.dart';
import 'package:get/get.dart';

class RestaurantMenuPageController extends GetxController with RestaurantMenuAnimations, SingleGetTickerProviderMixin {
  final RestaurantsPageController _restaurantsPageController;
  final IProductRepository _productRepository;

  RestaurantMenuPageController({
    required RestaurantsPageController restaurantsPageController,
    required IProductRepository productRepository,
  })  : _restaurantsPageController = restaurantsPageController,
        _productRepository = productRepository;

  RestaurantsPageController get getRestaurantsPageController => _restaurantsPageController;

  var mainColor = AppThemes.colors.black;
  var productList = <ProductModel>[].obs;

  late RestaurantModel restaurant;
  late StreamSubscription _productsStream;

  @override
  void onInit() {
    initAnimation();
    super.onInit();
  }

  initAnimation() {
    restaurant = Get.arguments['restaurant'];
    fetchProducts();
    mainColor = AppUtil.stringColorToColor(restaurant.primaryColor);

    appBarIconsColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    appBarIconsColorAnim =
        ColorTween(begin: AppThemes.colors.white, end: AppThemes.colors.black).animate(appBarIconsColorController);

    checkLuminanceColor(mainColor);
  }

  void fetchProducts() {
    _productsStream =
        _productRepository.getProductsByRestaurant(restaurantUid: restaurant.uid)!.listen(_listenProductsStream);
  }

  void _listenProductsStream(List<ProductModel> list) async {
    productList.value = list;
  }

  bool checkUserIsRestaurant() {
    return _restaurantsPageController.user.userType == 'restaurant';
  }

  String? formatMoney(num price) {
    if (price == 0) return null;
    return AppUtil.formatMoney(value: price, symbol: '').trim();
  }

  @override
  void onClose() {
    appBarIconsColorController.dispose();
    super.onClose();
  }
}
