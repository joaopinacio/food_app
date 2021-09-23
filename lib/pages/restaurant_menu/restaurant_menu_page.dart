import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_restaurant_menu_product_card/app_restaurant_menu_product_card_styles.dart';
import 'package:food_app/layout/styles/medium/app_restaurant_menu_type_card/app_restaurant_menu_type_card_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'restaurant_menu_page_controller.dart';

class RestaurantMenuPage extends GetView<RestaurantMenuPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.colors.primaryColor,
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
        opacity: 1,
        child: FloatingActionButton(
          backgroundColor: AppThemes.colors.primaryColor,
          child: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          AppBarStyles.searchWithReturn(
            onTapReturn: Get.back,
            onTapSearch: () {},
            iconsColor: Colors.white,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.ease,
              height: 550.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppThemes.colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppThemes.spacing.spacer_54.h),
                  AppTextStyles.bold_24(text: "Restaurante 01"),
                  SizedBox(height: AppThemes.spacing.spacer_6.h),
                  AppTextStyles.regular_14(text: "Lorem ipsum dolor sit amet, consectetur"),
                  SizedBox(height: AppThemes.spacing.spacer_6.h),
                  AppTextStyles.light_12(text: "Lorem ipsum dolor sit amet, consectetur"),
                  SizedBox(height: AppThemes.spacing.spacer_24.h),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (value) {
                        return true;
                      }, // controller.onNotifyScroll,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                              child: Container(
                                height: 85.h,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  // listTypeFood.map((item) { }).toList(),
                                  children: [
                                    AppRestaurantMenuTypeCardStyles.standard(behaviour: Behaviour.regular),
                                    AppRestaurantMenuTypeCardStyles.standard(behaviour: Behaviour.regular),
                                    AppRestaurantMenuTypeCardStyles.standard(behaviour: Behaviour.regular),
                                    AppRestaurantMenuTypeCardStyles.standard(behaviour: Behaviour.regular),
                                    AppRestaurantMenuTypeCardStyles.standard(behaviour: Behaviour.regular),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: AppThemes.spacing.spacer_24.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                              child: AppTextStyles.semiBold_14(text: "Promotions"),
                            ),
                            SizedBox(height: AppThemes.spacing.spacer_12.h),
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 15.h,
                              crossAxisCount: 2,
                              childAspectRatio: 0.43.h,
                              shrinkWrap: true,
                              children: [
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                                AppRestaurantMenuProductCardStyles.standard(behaviour: Behaviour.regular),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.55.h),
            child: Hero(
              tag: 'Lala',
              child: Image.asset(
                'assets/images/bag-icon.png',
                scale: 5.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
