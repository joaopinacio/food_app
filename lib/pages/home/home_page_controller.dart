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

    colorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    colorAnim =
        ColorTween(begin: AppThemes.colors.primaryColor, end: AppThemes.colors.primaryColor).animate(colorController);
  }

  fetchRestaurants() {
    _restaurantsStream = _restaurantRepository.getRestaurants()!.listen(_listenRestaurantsStream);
  }

  _listenRestaurantsStream(List<RestaurantModel> list) {
    restaurantList.value = list;
    if (isLoading) {
      var restaurantColor = Color(int.parse(restaurantList[0].primaryColor.replaceAll('#', '0xff')));
      colorAnim = ColorTween(begin: AppThemes.colors.primaryColor, end: restaurantColor).animate(colorController);
      colorController.forward();
      isLoading = false;
    }
  }

  @override
  void onClose() {
    _restaurantsStream.cancel();
    colorController.dispose();
  }
}
