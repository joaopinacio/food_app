import 'package:flutter/material.dart';
import 'package:food_app/layout/styles/small/app_input_text/app_input_text_styles.dart';
import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AppInputTextStyles.standard(
            customKey: UniqueKey(),
            hintText: "Test",
            controller: controller.inputController,
            focusNode: controller.inputFocusNode,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
