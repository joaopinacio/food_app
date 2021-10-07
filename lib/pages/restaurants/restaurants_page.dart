import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/large/app_carousel_slider_card/app_carousel_slider_card_styles.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'restaurants_page_controller.dart';

class RestaurantsPage extends GetView<RestaurantsPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AnimatedBuilder(
        animation: controller.backgroundColorController,
        builder: (contextAnim, child) => Scaffold(
          backgroundColor: controller.backgroundColorAnim.value,
          appBar: AppBarStyles.leftAndRightIcon(
            leftIcon: AppThemes.icons.menu,
            onTapRight: () {},
            rightIcon: Icons.search,
            onTapLeft: controller.goToCameraPage,
            iconsColor: controller.appBarIconsColorAnim.value,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              width: 230.w,
              height: 50.h,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: AppTextStyles.bold_14(text: 'Order Here', color: AppThemes.colors.white),
                backgroundColor: Colors.black,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
              child: controller.getBehaviour == Behaviour.loading
                  ? CarouselSlider.builder(
                      options: controller.carouselOptions,
                      itemCount: 3,
                      itemBuilder: (BuildContext carouselContext, int index, _) {
                        return AppCarouselSliderCardStyles.standard(
                          behaviour: Behaviour.loading,
                          logoImage: 'assets/images/bag-icon.png', // restaurant.logo.filePath,
                          primaryImage: 'assets/images/drumstick-icon.png', // restaurant.primaryImage.filePath,
                          title: '',
                          mainColor: AppThemes.colors.primaryColor, // restaurant.primaryColor,
                          onTap: () {},
                        );
                      },
                    )
                  : CarouselSlider.builder(
                      options: controller.carouselOptions,
                      itemCount: controller.restaurantList.length,
                      itemBuilder: (BuildContext carouselContext, int index, _) {
                        var restaurant = controller.restaurantList[index];
                        return AppCarouselSliderCardStyles.standard(
                          behaviour: Behaviour.regular,
                          logoImage: 'assets/images/bag-icon.png', // restaurant.logo,
                          primaryImage: 'assets/images/drumstick-icon.png', // restaurant.primaryImage,
                          title: restaurant.name,
                          mainColor: AppThemes.colors.primaryColor, // restaurant.primaryColor,
                          onTap: controller.goToRestaurantMenu,
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
