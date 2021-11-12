import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_default_photo/app_default_photo_styles.dart';
import 'package:food_app/layout/styles/small/app_ink_well/app_ink_well_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_photo/app_photo_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'product_edit_page_controller.dart';

class ProductEditPage extends GetView<ProductEditController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Obx(
        () => Scaffold(
          body: Scaffold(
            appBar: AppBarStyles.onlyTitleAndBack(
              title: 'product'.tr,
              onTapBack: Get.back,
            ),
            bottomNavigationBar: AppTextButtonStyles.rounded(
              label: 'save'.tr,
              onTap: controller.save,
              hasBounce: true,
              margin: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 15.h),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                right: AppThemes.spacing.spacer_24.w,
                left: AppThemes.spacing.spacer_24.w,
                top: AppThemes.spacing.spacer_18.h,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: controller.getProductImage.filePath!.isEmpty
                          ? controller.getProductImage.url!.isEmpty
                              ? AppInkWellStyles.standard(
                                  onTap: () {
                                    controller.goToCameraPage(true);
                                  },
                                  child: AppDefaultPhotoStyles.standard(
                                    color: controller.getErrorRequiredImage ? AppThemes.colors.generalRed_25 : null,
                                    size: 75.sp,
                                  ),
                                )
                              : AppInkWellStyles.standard(
                                  onTap: () {
                                    controller.goToCameraPage(true);
                                  },
                                  child: Hero(
                                    tag: controller.product.image.url!,
                                    child: AppNetworkImageStyles.standard(
                                      behaviour: Behaviour.regular,
                                      image: controller.getProductImage.url!,
                                      height: 65.h,
                                      width: 80.w,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                )
                          : AppInkWellStyles.standard(
                              onTap: () {
                                controller.goToCameraPage(true);
                              },
                              child: Hero(
                                tag: controller.product.image.url!,
                                child: AppPhotoStyles.standard(
                                  filePath: controller.getProductImage.filePath!,
                                  size: 75.sp,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: AppInputTextStyles.standard(
                        customKey: controller.nameKey,
                        hintText: 'name'.tr,
                        controller: controller.nameController,
                        focusNode: controller.nameFocusNode,
                        validator: controller.validatorName,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: AppInputTextStyles.standard(
                            customKey: controller.priceKey,
                            hintText: 'price'.tr,
                            controller: controller.priceController,
                            focusNode: controller.priceFocusNode,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppInputTextStyles.standard(
                            customKey: controller.oldPriceKey,
                            hintText: 'promotion'.tr,
                            controller: controller.oldPriceController,
                            focusNode: controller.oldPriceFocusNode,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
