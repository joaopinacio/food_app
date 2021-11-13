import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_card_product_cart/app_card_product_cart_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'cart_page_controller.dart';

class CartPage extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          appBar: AppBarStyles.onlyTitleAndBack(
            title: 'order_details'.tr,
            onTapBack: Get.back,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: AppTextStyles.semiBold_18(text: 'my_cart'.tr),
                ),
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.getCart.productsCart.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext contextList, int index) {
                      var productCart = controller.getCart.productsCart[index];
                      return AppCardProductCartStyles.standard(
                        behaviour: Behaviour.regular,
                        name: productCart.name,
                        totalPrice: controller.formatPrice(productCart.total),
                        productQty: productCart.qty,
                        onChangeQty: (value) =>
                            controller.getRestaurantMenuPageController.changeProductQty(value, index),
                        mainColor: controller.getRestaurantMenuPageController.mainColor,
                        iconsColor: controller.getRestaurantMenuPageController.cartIconColor,
                        imageUrl: productCart.image.url!,
                        onRemove: () => controller.getRestaurantMenuPageController.removeProductCart(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
