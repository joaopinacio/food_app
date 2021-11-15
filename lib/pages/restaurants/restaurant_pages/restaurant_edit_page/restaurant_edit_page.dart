import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/auxiliary_widgets/app_alert_dialog.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:food_app/layout/styles/medium/app_modal_bottom_sheet/app_modal_bottom_sheet_styles.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_default_photo/app_default_photo_styles.dart';
import 'package:food_app/layout/styles/small/app_ink_well/app_ink_well_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_photo/app_photo_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'restaurant_edit_page_controller.dart';

class RestaurantEditPage extends GetView<RestaurantEditController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          backgroundColor: AppThemes.colors.white,
          body: Scaffold(
            backgroundColor: AppThemes.colors.white,
            appBar: AppBarStyles.titleBackAndRightIcon(
              title: 'restaurant'.tr,
              onTapBack: Get.back,
              rightIcon: Icons.fastfood_rounded,
              onTapRight: controller.goToProductsPage,
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
                    Padding(
                      padding: EdgeInsets.only(left: 17.w),
                      child: AppTextStyles.semiBold_14(
                        text: 'Logo',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        controller.getLogoImage.filePath!.isEmpty
                            ? controller.getLogoImage.url!.isEmpty
                                ? AppInkWellStyles.standard(
                                    onTap: () {
                                      controller.goToCameraPage(true);
                                    },
                                    child: AppDefaultPhotoStyles.standard(
                                      color: controller.getErrorRequiredLogo ? AppThemes.colors.generalRed_25 : null,
                                    ),
                                  )
                                : AppInkWellStyles.standard(
                                    onTap: () {
                                      controller.goToCameraPage(true);
                                    },
                                    child: AppNetworkImageStyles.standard(
                                      behaviour: Behaviour.regular,
                                      image: controller.getLogoImage.url!,
                                      height: 60,
                                      width: 65,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  )
                            : AppInkWellStyles.standard(
                                onTap: () {
                                  controller.goToCameraPage(true);
                                },
                                child: AppPhotoStyles.standard(filePath: controller.getLogoImage.filePath!),
                              ),
                        SizedBox(width: 10.h),
                        Expanded(
                          child: AppInputTextStyles.standard(
                            customKey: controller.nameKey,
                            hintText: 'restaurant_name'.tr,
                            controller: controller.nameController,
                            focusNode: controller.nameFocusNode,
                            validator: controller.validatorName,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 0.w),
                      child: AppTextStyles.semiBold_14(
                        text: 'Imagem Primária',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        controller.getPrimaryImage.filePath!.isEmpty
                            ? controller.getPrimaryImage.url!.isEmpty
                                ? AppInkWellStyles.standard(
                                    onTap: () {
                                      controller.goToCameraPage(false);
                                    },
                                    child: AppDefaultPhotoStyles.standard(
                                      color: controller.getErrorRequiredPrimaryImage
                                          ? AppThemes.colors.generalRed_25
                                          : null,
                                    ),
                                  )
                                : AppInkWellStyles.standard(
                                    onTap: () {
                                      controller.goToCameraPage(false);
                                    },
                                    child: AppNetworkImageStyles.standard(
                                      behaviour: Behaviour.regular,
                                      image: controller.getPrimaryImage.url!,
                                      height: 60,
                                      width: 65,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  )
                            : AppInkWellStyles.standard(
                                onTap: () {
                                  controller.goToCameraPage(false);
                                },
                                child: AppPhotoStyles.standard(filePath: controller.getPrimaryImage.filePath!),
                              ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppInputTextStyles.standard(
                            customKey: controller.restaurantTypeKey,
                            hintText: 'restaurant_type'.tr,
                            controller: controller.restaurantTypeController,
                            focusNode: controller.restaurantTypeFocusNode,
                            validator: controller.validatorRestauranteType,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    AppInputTextStyles.standard(
                      customKey: controller.restaurantDescKey,
                      hintText: 'description'.tr,
                      controller: controller.restaurantDescController,
                      focusNode: controller.restaurantDescFocusNode,
                      validator: controller.validatorRestauranteDesc,
                      maxLines: 2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextButtonStyles.primary(
                          label: 'color'.tr,
                          onTap: controller.chooseColor,
                          isStretched: false,
                          hasBounce: true,
                          width: 80.w,
                          backgroundColor: controller.getMainColor,
                          foregroundColor: controller.getForegroundColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        AppTextButtonStyles.primary(
                          label: controller.getListGridLengthLabel,
                          showIconNext: true,
                          iconNext: Icons.arrow_drop_down_rounded,
                          onTap: () {
                            AppModalBottomSheetStyles.listGridLength(
                              length: controller.listGridLength,
                              onChoose: controller.chooseListGridLength,
                            );
                          },
                          isStretched: false,
                          hasBounce: true,
                          width: 105.w,
                          backgroundColor: AppThemes.colors.generalBlue,
                          foregroundColor: AppThemes.colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        AppInkWellStyles.standard(
                          onTap: () => AppAlertDialog.showDialogStandard(
                            type: DialogType.QUESTION,
                            title: 'colors_and_grid'.tr,
                            description: 'choose_specific_color'.tr,
                          ),
                          child: Icon(Icons.help_outline_rounded, size: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Visibility(
                      visible: controller.getRequiredColorVisible,
                      child: Center(
                        child: AppTextStyles.semiBold_14(
                          text: '${'insert_a_color'.tr}!',
                          color: AppThemes.colors.generalRed,
                        ),
                      ),
                    ),

                    // SizedBox(height: 60.h),
                    // Center(
                    //   child: AppTextButtonStyles.rounded(
                    //     label: 'save'.tr,
                    //     onTap: controller.save,
                    //     hasBounce: true,
                    //   ),
                    // ),
                    // SizedBox(height: 20.h),
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
