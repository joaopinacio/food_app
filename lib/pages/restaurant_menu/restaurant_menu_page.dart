import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_modal_bottom_sheet/app_modal_bottom_sheet_styles.dart';
import 'package:food_app/layout/styles/medium/app_restaurant_menu_product_card/app_restaurant_menu_product_card_styles.dart';
import 'package:food_app/layout/styles/medium/app_restaurant_menu_type_card/app_restaurant_menu_type_card_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'restaurant_menu_page_controller.dart';

class RestaurantMenuPage extends GetView<RestaurantMenuPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.mainColor,
        floatingActionButton: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
          opacity: controller.checkUserIsRestaurant() ? 0.3 : 1,
          child: FloatingActionButton(
            backgroundColor: controller.mainColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: controller.cartIconColor,
                ),
                Visibility(
                  visible: controller.getCart.qty > 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: AppThemes.colors.generalRed,
                        borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      ),
                      child: Center(
                        child: AppTextStyles.medium_10(
                          text: controller.getCart.qty.toString(),
                          color: AppThemes.colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            onPressed: controller.goToCartPage,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: AppTextStyles.bold_24(
                        text: controller.restaurant.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: AppTextStyles.regular_14(
                        text: controller.restaurant.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Row(
                        children: [
                          SizedBox(width: 75.w),
                          Icon(Icons.star_rounded, color: AppThemes.colors.generalYellow),
                          AppTextStyles.medium_14(text: controller.restaurant.rate.toString()),
                          SizedBox(width: 10.w),
                          AppTextStyles.medium_14(text: '•'),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: AppTextStyles.medium_14(
                              text: controller.restaurant.restaurantType,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                        title: 'Tipo 1',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Tipo 2',
                                        image: 'assets/images/salad-icon.png',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Tipo 3',
                                        image: 'assets/images/drink-lemon-icon.png',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Tipo 4',
                                      ),
                                      AppRestaurantMenuTypeCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: 'Tipo 5',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: AppThemes.spacing.spacer_24.h),
                              // listProducts.map((item) { }).toList(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                                child: AppTextStyles.semiBold_14(text: 'products'.tr),
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
                                children: controller.productList
                                    .map(
                                      (product) => AppRestaurantMenuProductCardStyles.standard(
                                        behaviour: Behaviour.regular,
                                        title: product.name,
                                        image: product.image.url,
                                        description:
                                            'lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet',
                                        price: controller.formatMoney(product.price)!,
                                        oldPrice: controller.formatMoney(product.oldPrice!, isOldPrice: true),
                                        inCart: controller.productInCart(product.uid),
                                        onTap: () {
                                          AppModalBottomSheetStyles.product(
                                            title: product.name,
                                            image: product.image.url,
                                            price: controller.formatMoney(product.price)!,
                                            description:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra,  sit amet, consectetur adipiscing elit. Lorem ipsum dolor, consec',
                                            onSave: () => controller.btnAddToCart(product),
                                            colorQty: controller.mainColor,
                                            colorQtyIcons: controller.cartIconColor,
                                            isUserRestaurant: controller.checkUserIsRestaurant(),
                                            onChangeQty: (value) {
                                              controller.qtySelected = value;
                                            },
                                            initialValue: 1,
                                          );
                                        },
                                      ),
                                    )
                                    .toList(),
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
                alignment: Alignment(0, -0.57.h),
                child: Hero(
                  tag: controller.restaurant.logo.url!,
                  child: AppNetworkImageStyles.standard(
                    behaviour: Behaviour.regular,
                    image: controller.restaurant.logo.url!,
                    height: 60.h,
                    width: 70.w,
                    borderRadius: BorderRadius.circular(50.r),
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
