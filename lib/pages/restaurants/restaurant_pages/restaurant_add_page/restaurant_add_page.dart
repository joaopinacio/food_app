import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'restaurant_add_page_controller.dart';

class RestaurantAddPage extends GetView<RestaurantAddController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.fromSignUp,
      child: Scaffold(
        appBar: AppBarStyles.onlyTitleAndBack(
          title: 'restaurant'.tr,
          onTapBack: Get.back,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            right: AppThemes.spacing.spacer_24.w,
            left: AppThemes.spacing.spacer_24.w,
            top: AppThemes.spacing.spacer_18.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 70.sp,
                    height: 70.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppThemes.colors.grayScale_2,
                    ),
                    child: Center(
                      child: Icon(Icons.photo_camera_rounded),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      children: [
                        AppInputTextStyles.standard(
                          customKey: controller.nameKey,
                          hintText: 'name'.tr,
                          controller: controller.nameController,
                          focusNode: controller.nameFocusNode,
                        ),
                        SizedBox(height: 5.h),
                        Text('Cor Aqui'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              Row(
                children: [
                  Container(
                    width: 70.sp,
                    height: 70.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppThemes.colors.grayScale_2,
                    ),
                    child: Center(
                      child: Icon(Icons.photo_camera_rounded),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: AppInputTextStyles.standard(
                      customKey: controller.restaurantTypeKey,
                      hintText: 'restaurant_type'.tr,
                      controller: controller.restaurantTypeController,
                      focusNode: controller.restaurantTypeFocusNode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
