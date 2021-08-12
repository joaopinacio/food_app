import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_badge/app_badge_styles.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppThemes.colors.primaryColor,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOutSine,
                  height: controller.getContainerHeight.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppThemes.colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.r),
                      topRight: Radius.circular(36.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: AppThemes.spacing.spacer_64.h),
                        AppTextStyles.bold(
                          text: 'Hey, Sign In.',
                          textAlign: TextAlign.left,
                          margin: EdgeInsets.only(left: 50.w, right: 170.w),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_34.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.w),
                          child: AppInputTextStyles.login(
                            customKey: controller.loginKey,
                            hintText: 'email',
                            controller: controller.loginController,
                            focusNode: controller.loginFocusNode,
                            suffixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.w),
                          child: AppInputTextStyles.login(
                            customKey: controller.passwordKey,
                            hintText: 'password',
                            controller: controller.passwordController,
                            focusNode: controller.passwordFocusNode,
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        AppTextButtonStyles.linkSmall(
                          label: 'Forgot Password?',
                          labelAlign: TextAlign.right,
                          padding: EdgeInsets.only(right: 65.w),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.77),
                child: Hero(
                  tag: 'logo',
                  child: AppBadgeStyles.logo(size: 88),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
