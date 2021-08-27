import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final IRestaurantRepository _restaurantRepository;

  HomePageController({required IRestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository {
    init();
  }

  late StreamSubscription _restaurantsStream;

  var restaurantList = <RestaurantModel>[].obs;

  var carouselOptions = CarouselOptions(
    height: 750,
    aspectRatio: 16 / 9,
    viewportFraction: 0.8,
    initialPage: 0,
    enableInfiniteScroll: true,
    enlargeCenterPage: true,
    // onPageChanged: onPageChanged,
    scrollDirection: Axis.horizontal,
  );

  init() {
    fetchRestaurants();
  }

  fetchRestaurants() {
    _restaurantsStream = _restaurantRepository.getRestaurants()!.listen(_listenRestaurantsStream);
  }

  _listenRestaurantsStream(List<RestaurantModel> list) {
    restaurantList.value = list;
    print(restaurantList.length);
  }

  @override
  void onClose() {
    _restaurantsStream.cancel();
  }
}
