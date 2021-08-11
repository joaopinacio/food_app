import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_animated_splash_background/app_animated_splash_background_styles.dart';
import 'package:food_app/layout/styles/small/app_badge/app_badge_styles.dart';
import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          body: Stack(
            children: [
              Center(
                child: AppAnimatedSplashBackgroundStyles.standard(
                  size: 30.sp,
                  duration: 1000,
                ),
              ),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.elasticInOut,
                  width: 100.w,
                  height: controller.getLogoHeight.h,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: controller.getLogoOpacity,
                    child: AppBadgeStyles.logo(),
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
