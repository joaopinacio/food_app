import 'package:flutter/material.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final AppPages _appPages;

  LoginPageController({required AppPages appPages}) : _appPages = appPages {
    init();
  }

  var containerHeight = 0.0.obs;
  var loginController = TextEditingController();
  var loginFocusNode = FocusNode();
  var loginKey = UniqueKey();
  var passwordController = TextEditingController();
  var passwordFocusNode = FocusNode();
  var passwordKey = UniqueKey();

  double get getContainerHeight => containerHeight.value;

  init() {
    Future.delayed(Duration(milliseconds: 500), () {
      containerHeight.value = 567;
    });
  }
}
