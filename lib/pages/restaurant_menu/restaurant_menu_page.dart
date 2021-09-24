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
    return Obx(
      () => Scaffold(
        backgroundColor: AppThemes.colors.black,
        floatingActionButton: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
          opacity: 1,
          child: FloatingActionButton(
            backgroundColor: controller.mainColor,
            child: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                onEnd: controller.onMainContainerEnd,
                duration: Duration(milliseconds: 700),
                curve: Curves.ease,
                height: controller.getMainContainerHeight.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppThemes.colors.white,
                  borderRadius: controller.getMainContainerBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppThemes.spacing.spacer_36.h),
                    AppTextStyles.bold_24(
                      text: "Restaurante 01",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    AppTextStyles.regular_14(text: "Lorem ipsum dolor sit amet, consectetur"),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    AppTextStyles.light_12(text: "Lorem ipsum dolor sit amet, consectetur"),
                    SizedBox(height: AppThemes.spacing.spacer_24.h),
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: controller.onNotifyScroll, // controller.onNotifyScroll,
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
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Promotions',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Promotions',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Promotions',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Promotions',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Promotions',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: AppThemes.spacing.spacer_24.h),
                              // listProducts.map((item) { }).toList(),
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
                                // listProducts.map((item) { }).toList(),
                                children: [
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                    oldPrice: '25,99',
                                  ),
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                  ),
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                  ),
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                  ),
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                  ),
                                  AppRestaurantMenuProductCardStyles.standard(
                                    behaviour: Behaviour.regular,
                                    title: 'Food One',
                                    description:
                                        'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                    price: '14,99',
                                  ),
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
            Container(
              height: 73.h,
              child: AnimatedBuilder(
                animation: controller.appBarIconsColorController,
                builder: (contextAnim, child) => AppBarStyles.searchWithReturn(
                  onTapReturn: Get.back,
                  onTapSearch: () {},
                  iconsColor: controller.getAppBarIconsColorAnim,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: controller.getMainImageOpacity,
              child: Align(
                alignment: Alignment(0, -0.56.h),
                child: Hero(
                  tag: 'Lala',
                  child: Image.asset(
                    'assets/images/bag-icon.png',
                    scale: 5.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
