import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:food_app/pages/aux_pages/camera/camera_page_controller.dart';
import 'package:get/get.dart';

class CameraPage extends GetView<CameraPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        appBar: AppBarStyles.onlyTitleAndBack(
          title: 'image'.tr,
          onTapBack: controller.pop,
        ),
        bottomNavigationBar: AppTextButtonStyles.primary(
          label: 'save'.tr.toUpperCase(),
          onTap: controller.pop,
        ),
        body: SafeArea(
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: controller.imagePath.isEmpty
                      ? controller.hashMD5.isEmpty && controller.url.isEmpty
                          ? Container(
                              height: Get.height / 2.5,
                              color: AppThemes.colors.grayScale_2,
                            )
                          // Container(
                          //     height: Get.height / 2.5,
                          //     child: NexDefaultPhotoStyles.standard(
                          //       behaviour: Behaviour.regular,
                          //       width: double.infinity,
                          //       iconSize: 60,
                          //     ),
                          //   )
                          : Center(child: _loadImageStorage())
                      : Image.file(
                          File(controller.getImagePath),
                          fit: BoxFit.fitHeight,
                          color: Color(0xffEBEBEB).withOpacity(0.5),
                          colorBlendMode: BlendMode.multiply,
                        ),
                ),
                Container(
                  height: 45.h,
                  child: Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: controller.loadCamera,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera,
                                size: 18.sp,
                              ),
                              SizedBox(width: 12.w),
                              AppTextStyles.regular_12(
                                text: 'take_a_picture'.tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(width: 1.w, color: AppThemes.colors.grayScale_2),
                      Flexible(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: controller.loadImage,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image, size: 18.sp),
                              SizedBox(width: 12.w),
                              AppTextStyles.regular_12(
                                text: 'gallery'.tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 1.h, color: AppThemes.colors.grayScale_2),
              ],
            );
          }),
        ),
      ),
    );
  }

  _loadImageStorage() {
    return CachedNetworkImage(
      color: Color(0xffEBEBEB).withOpacity(0.5),
      colorBlendMode: BlendMode.multiply,
      fit: BoxFit.contain,
      imageUrl: controller.getUrl,
      placeholder: (context, url) => Image.asset(
        'assets/images/product_image_default.png',
        fit: BoxFit.contain,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/product_image_default.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
