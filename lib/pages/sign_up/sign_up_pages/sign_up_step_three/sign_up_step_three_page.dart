import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_animated_steps/app_animated_steps_styles.dart';
import 'package:food_app/layout/styles/small/app_badge/app_badge_styles.dart';
import 'package:food_app/layout/styles/small/app_ink_well/app_ink_well_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

import 'sign_up_step_three_page_controller.dart';

class SignUpStepThreePage extends GetView<SignUpStepThreePageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppThemes.colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppThemes.spacing.spacer_38.h),
                Hero(
                  tag: 'logo',
                  child: AppBadgeStyles.logo(size: 65),
                ),
                SizedBox(height: AppThemes.spacing.spacer_12.h),
                AppTextStyles.bold_36(text: 'sign_up'.tr),
                SizedBox(height: AppThemes.spacing.spacer_20.h),
                AppAnimatedStepsStyles.standard(
                  size: 11,
                  groupWidth: 55,
                  duration: 1200,
                  goTo: controller.getSignUpPageController.getGoTo,
                ),
                SizedBox(height: AppThemes.spacing.spacer_50.h),
                FadeInRight(
                  delay: Duration(milliseconds: 250),
                  from: 50,
                  controller: (controllerAnim) => controller.textAnimInit(controllerAnim),
                  child: AppTextStyles.regular_16(
                    text: 'choose_your_password'.tr,
                    margin: EdgeInsets.symmetric(horizontal: 43.w),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_16.h),
                FadeInRight(
                  delay: Duration(milliseconds: 250),
                  from: 50,
                  controller: (controllerAnim) => controller.passwordAnimInit(controllerAnim),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_44.w),
                    child: AppInputTextStyles.standard(
                      customKey: controller.passwordKey,
                      hintText: 'password'.tr,
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                      validator: controller.validatorPassword,
                      obscureText: controller.getObscurePassword,
                      suffixIcon: AppInkWellStyles.standard(
                        child: Icon(controller.getObscurePassword ? Icons.visibility_off : Icons.visibility),
                        onTap: controller.toogleObscurePassword,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_10.h),
                FadeInRight(
                  delay: Duration(milliseconds: 250),
                  from: 50,
                  controller: (controllerAnim) => controller.confirmPasswordAnimInit(controllerAnim),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_44.w),
                    child: AppInputTextStyles.standard(
                      customKey: controller.confirmPasswordKey,
                      hintText: 'confirm_password'.tr,
                      controller: controller.confirmPasswordController,
                      focusNode: controller.confirmPasswordFocusNode,
                      validator: controller.validatorConfirmPassword,
                      obscureText: controller.getObscureConfirmPassword,
                      suffixIcon: AppInkWellStyles.standard(
                        child: Icon(controller.getObscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                        onTap: controller.toogleObscureConfirmPassword,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_104.h),
                AppTextButtonStyles.rounded(
                  label: 'continue'.tr,
                  hasBounce: true,
                  onTap: controller.toFinish,
                ),
                SizedBox(height: AppThemes.spacing.spacer_24.h),
                AppInkWellStyles.standard(
                  onTap: controller.goBack,
                  child: AppTextStyles.regular_16(
                    text: 'return'.tr,
                    color: AppThemes.colors.generalRed,
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
