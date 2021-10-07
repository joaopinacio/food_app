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

import 'sign_up_step_two' '_page_controller.dart';

class SignUpStepTwoPage extends GetView<SignUpStepTwoPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                    text: 'tell_us_your_email'.trParams({
                      'first_name': controller.getSignUpPageController.user.firstName,
                    }),
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_16.h),
                FadeInRight(
                  delay: Duration(milliseconds: 250),
                  from: 50,
                  controller: (controllerAnim) => controller.emailAnimInit(controllerAnim),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_44.w),
                    child: AppInputTextStyles.standard(
                      customKey: controller.emailKey,
                      hintText: 'email'.tr,
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      validator: controller.validatorEmail,
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppThemes.spacing.spacer_137.h),
                AppTextButtonStyles.rounded(
                  label: 'continue'.tr,
                  hasBounce: true,
                  onTap: controller.toStepThree,
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
