import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

import 'mixins/carousel_animation_mixin.dart';

class HomePageController extends GetxController with SingleGetTickerProviderMixin, CarouselAnimationMixin {
  final IRestaurantRepository _restaurantRepository;

  HomePageController({required IRestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository {
    init();
  }

  late StreamSubscription _restaurantsStream;
  late CarouselOptions carouselOptions;
  var isLoading = true;

  init() async {
    fetchRestaurants();

    carouselOptions = CarouselOptions(
      height: 750,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      onPageChanged: onPageChanged,
      scrollDirection: Axis.horizontal,
    );

    backgroundColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    appBarIconsColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    backgroundColorAnim = ColorTween(begin: AppThemes.colors.primaryColor, end: AppThemes.colors.primaryColor)
        .animate(backgroundColorController);

    appBarIconsColorAnim =
        ColorTween(begin: AppThemes.colors.white, end: AppThemes.colors.black).animate(appBarIconsColorController);
  }

  fetchRestaurants() {
    _restaurantsStream = _restaurantRepository.getRestaurants()!.listen(_listenRestaurantsStream);
  }

  _listenRestaurantsStream(List<RestaurantModel> list) {
    restaurantList.value = list;
    if (isLoading) {
      var restaurantColor = Color(int.parse(restaurantList[0].primaryColor.replaceAll('#', '0xff')));
      backgroundColorAnim =
          ColorTween(begin: AppThemes.colors.primaryColor, end: restaurantColor).animate(backgroundColorController);
      checkLuminanceColor(restaurantColor);
      backgroundColorController.forward();
      currentColor = restaurantColor;
      isLoading = false;
    } else {
      changeBackgroundColorByList();
    }
  }

  @override
  void onClose() {
    _restaurantsStream.cancel();
    backgroundColorController.dispose();
  }
}
