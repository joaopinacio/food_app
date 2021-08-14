import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/gestures.dart';
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
                      topLeft: Radius.circular(
                        controller.getContainerBorderRadius.r,
                      ),
                      topRight: Radius.circular(
                        controller.getContainerBorderRadius.r,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: AppThemes.spacing.spacer_64.h),
                        FadeInUp(
                          delay: Duration(milliseconds: 1100),
                          duration: Duration(milliseconds: 500),
                          from: 50,
                          child: AppTextStyles.bold(
                            text: 'Hey,',
                            textAlign: TextAlign.left,
                            margin: EdgeInsets.only(right: 170.w),
                          ),
                        ),
                        FadeInUp(
                          delay: Duration(milliseconds: 1300),
                          duration: Duration(milliseconds: 500),
                          from: 50,
                          child: AppTextStyles.bold(
                            text: 'Sign In.',
                            textAlign: TextAlign.left,
                            margin: EdgeInsets.only(left: 50.w, right: 170.w),
                          ),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_34.h),
                        FadeInUp(
                          delay: Duration(milliseconds: 1500),
                          duration: Duration(milliseconds: 800),
                          from: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: AppInputTextStyles.login(
                              customKey: controller.loginKey,
                              hintText: 'email',
                              controller: controller.loginController,
                              focusNode: controller.loginFocusNode,
                              suffixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_16.h),
                        FadeInUp(
                          delay: Duration(milliseconds: 1700),
                          duration: Duration(milliseconds: 800),
                          from: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: AppInputTextStyles.login(
                              customKey: controller.passwordKey,
                              hintText: 'password',
                              controller: controller.passwordController,
                              focusNode: controller.passwordFocusNode,
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        FadeIn(
                          delay: Duration(milliseconds: 2100),
                          duration: Duration(milliseconds: 1200),
                          child: AppTextButtonStyles.linkSmall(
                            label: 'Forgot Password?',
                            labelAlign: TextAlign.right,
                            padding: EdgeInsets.only(right: 65.w),
                            labelColor: AppThemes.colors.primaryColor,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_20.h),
                        FlipInY(
                          delay: Duration(milliseconds: 2100),
                          duration: Duration(milliseconds: 800),
                          child: BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 0.5,
                            onPressed: controller.login,
                            child: AppTextButtonStyles.rounded(
                              label: 'Sign In',
                              hasBounce: true,
                            ),
                          ),
                        ),
                        SizedBox(height: AppThemes.spacing.spacer_48.h),
                        FadeInUp(
                          delay: Duration(milliseconds: 2600),
                          duration: Duration(milliseconds: 800),
                          from: 50,
                          child: RichText(
                            text: TextSpan(
                              text: 'I\'m a new user. ',
                              style: AppThemes.typography.poppinsRegular_16,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: AppThemes.colors.primaryColor,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
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
                  child: AnimatedContainer(
                    duration: Duration(
                        milliseconds:
                            controller.getLogoOpacity == 0 ? 700 : 1500),
                    curve: Curves.elasticInOut,
                    width: 100.w,
                    height: (controller.getLogoOpacity == 0 ? 17 : 95).h,
                    child: AnimatedOpacity(
                      duration: Duration(
                          milliseconds:
                              controller.getLogoOpacity == 0 ? 500 : 1000),
                      opacity: controller.getLogoOpacity,
                      child: AppBadgeStyles.logo(size: 88),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
