import 'package:food_app/layout/styles/default/app_default_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: AppTextDefaultStyles.standard(text: "Splash Page"),
        ),
      ),
    );
  }
}
