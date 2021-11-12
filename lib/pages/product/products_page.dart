import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_product_card/app_product_card_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'products_page_controller.dart';

class ProductsPage extends GetView<ProductsPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Obx(
        () => Scaffold(
          appBar: AppBarStyles.onlyTitleAndBack(
            title: 'products'.tr,
            onTapBack: Get.back,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppThemes.colors.generalGreen,
            child: Icon(
              Icons.add_rounded,
              color: AppThemes.colors.white,
              size: 25.sp,
            ),
            onPressed: controller.goToProductAdd,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: controller.getPageBehaviour == Behaviour.loading
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext contextList, int index) {
                        return AppProductCardStyles.standard(
                          behaviour: Behaviour.loading,
                          name: '',
                          price: '',
                          imageUrl: '',
                          onTap: () {},
                        );
                      })
                  : controller.productList.length == 0
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 110.h),
                            child: Container(
                              child: AppTextStyles.bold_18(text: 'Não há Produtos :c'),
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.productList.length,
                          itemBuilder: (BuildContext contextList, int index) {
                            var product = controller.productList[index];
                            return AppProductCardStyles.standard(
                              behaviour: Behaviour.regular,
                              name: product.name,
                              price: controller.formatPrice(product.price),
                              oldPrice: controller.formatPrice(product.oldPrice!),
                              imageUrl: product.image.url!,
                              onTap: () => controller.goToProductEdit(product),
                            );
                          }),
            ),
          ),
        ),
      ),
    );
  }
}
