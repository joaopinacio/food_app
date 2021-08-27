import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/large/app_carousel_slider_card/app_carousel_slider_card_styles.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBarStyles.leftAndRightIcon(
          leftIcon: Icons.menu,
          onTapRight: () {},
          rightIcon: Icons.search,
          onTapLeft: () {},
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: CarouselSlider(
              options: controller.carouselOptions,
              items: controller.restaurantList.map((restaurant) {
                return AppCarouselSliderCardStyles.standard(
                  logoImage: restaurant.logo,
                  primaryImage: restaurant.primaryImage,
                  title: restaurant.name,
                  mainColor: AppThemes.colors.primaryColor, // restaurant.primaryColor,
                  onTap: () {},
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}