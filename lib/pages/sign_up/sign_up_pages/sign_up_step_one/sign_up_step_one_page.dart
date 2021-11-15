import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_animated_steps/app_animated_steps_styles.dart';
import 'package:food_app/layout/styles/small/app_badge/app_badge_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'sign_up_step_one_page_controller.dart';

class SignUpStepOnePage extends GetView<SignUpStepOnePageController> {
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
                  child: AppTextStyles.regular_16(text: '${'tell_us_your_name'.tr} :)'),
                ),
                SizedBox(height: AppThemes.spacing.spacer_16.h),
                FadeInRight(
                  delay: Duration(milliseconds: 250),
                  from: 50,
                  controller: (controllerAnim) => controller.firstNameAnimInit(controllerAnim),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_44.w),
                    child: AppInputTextStyles.standard(
                      customKey: controller.firstNameKey,
                      hintText: 'first_name'.tr,
                      controller: controller.firstNameController,
                      focusNode: controller.firstNameFocusNode,
                      validator: controller.validatorFirstName,
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
                  controller: (controllerAnim) => controller.lastNameAnimInit(controllerAnim),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_44.w),
                    child: AppInputTextStyles.standard(
                      customKey: controller.lastNameKey,
                      hintText: 'last_name'.tr,
                      controller: controller.lastNameController,
                      focusNode: controller.lastNameFocusNode,
                      validator: controller.validatorLastName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                //Spacer(),
                SizedBox(height: AppThemes.spacing.spacer_104.h),
                AppTextButtonStyles.rounded(
                  label: 'continue'.tr,
                  hasBounce: true,
                  onTap: controller.toStepTwo,
                ),
                SizedBox(height: AppThemes.spacing.spacer_24.h),
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
                        recognizer: TapGestureRecognizer()..onTap = controller.toLoginPage,
                      ),
                    ],
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
