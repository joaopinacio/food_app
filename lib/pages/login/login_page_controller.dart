import 'package:flutter/material.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final AppPages _appPages;

  LoginPageController({required AppPages appPages}) : _appPages = appPages {
    init();
  }

  var containerHeight = 0.0.obs;
  var containerBorderRadius = 36.0.obs;
  var logoOpacity = 1.0.obs;

  var loginController = TextEditingController();
  var loginFocusNode = FocusNode();
  var loginKey = UniqueKey();
  var passwordController = TextEditingController();
  var passwordFocusNode = FocusNode();
  var passwordKey = UniqueKey();

  double get getContainerHeight => containerHeight.value;
  double get getContainerBorderRadius => containerBorderRadius.value;
  get getLogoOpacity => logoOpacity.value;

  init() {
    Future.delayed(Duration(milliseconds: 500), () {
      containerHeight.value = 567;
    });

    loginFocusNode.addListener(() {
      if (loginFocusNode.hasFocus) {
        containerHeight.value = Get.height - Get.statusBarHeight - 30;
        containerBorderRadius.value = 0;
        logoOpacity.value = 0;
      } else {
        containerHeight.value = 567;
        containerBorderRadius.value = 36;
        logoOpacity.value = 1;
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        containerHeight.value = Get.height - Get.statusBarHeight - 30;
        containerBorderRadius.value = 0;
        logoOpacity.value = 0;
      } else {
        containerHeight.value = 567;
        containerBorderRadius.value = 36;
        logoOpacity.value = 1;
      }
    });
  }
}
