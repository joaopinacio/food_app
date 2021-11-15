import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_badge/app_badge_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'sign_up_page_controller.dart';

class SignUpPage extends GetView<SignUpPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: AppThemes.spacing.spacer_50.h),
            Hero(
              tag: 'logo',
              child: AppBadgeStyles.logo(size: 65),
            ),
            SizedBox(height: AppThemes.spacing.spacer_12.h),
            AppTextStyles.bold_36(text: 'sign_up'.tr),
            SizedBox(height: AppThemes.spacing.spacer_98.h),
            AppTextStyles.regular_16(text: 'want_register_as'.tr),
            SizedBox(height: AppThemes.spacing.spacer_24.h),
            AppTextButtonStyles.rounded(
              label: 'customer'.tr,
              hasBounce: true,
              color: AppThemes.colors.generalRed,
              onTap: controller.goToStepOneCustomer,
            ),
            SizedBox(height: AppThemes.spacing.spacer_16.h),
            AppTextButtonStyles.rounded(
              label: 'restaurant'.tr,
              hasBounce: true,
              onTap: controller.goToStepOneRestaurant,
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                text: '${'already_a_user'.tr} ',
                style: AppThemes.typography.poppinsRegular_16,
                children: <TextSpan>[
                  TextSpan(
                    text: 'sign_in'.tr,
                    style: TextStyle(
                      color: AppThemes.colors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = Get.back,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppThemes.spacing.spacer_64.h),
          ],
        ),
      ),
    );
  }
}
