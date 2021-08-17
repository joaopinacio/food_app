import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoginAnimationsMixin on GetxController {
  late AnimationController firstTitleController;
  late AnimationController secondTitleController;
  late AnimationController emailAnimController;
  late AnimationController passwordAnimController;
  late AnimationController forgotPassController;
  late AnimationController signInController;
  late AnimationController signUpController;

  var loginFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  var containerHeight = 0.0.obs;
  var containerBorderRadius = 36.0.obs;
  var logoOpacity = 1.0.obs;

  double get getContainerHeight => containerHeight.value;
  double get getContainerBorderRadius => containerBorderRadius.value;
  get getLogoOpacity => logoOpacity.value;

  bool get logoOpacityIsEqualZero => getLogoOpacity == 0;

  initAnimations() {
    Future.delayed(Duration(milliseconds: 500), () {
      containerHeight.value = 567;
    });
  }

  firstTitleAnimInit(controller) {
    firstTitleController = controller;
    firstTitleController.duration = Duration(milliseconds: 500);
    Future.delayed(Duration(milliseconds: 1100), () {
      firstTitleController.forward();
    });
  }

  secondTitleAnimInit(controller) {
    secondTitleController = controller;
    secondTitleController.duration = Duration(milliseconds: 500);
    Future.delayed(Duration(milliseconds: 1300), () {
      secondTitleController.forward();
    });
  }

  emailAnimInit(controller) {
    emailAnimController = controller;
    emailAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 1500), () {
      emailAnimController.forward();
    });
  }

  passwordAnimInit(controller) {
    passwordAnimController = controller;
    passwordAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 1700), () {
      passwordAnimController.forward();
    });
  }

  forgotPassAnimInit(controller) {
    forgotPassController = controller;
    forgotPassController.duration = Duration(milliseconds: 1200);
    Future.delayed(Duration(milliseconds: 2100), () {
      forgotPassController.forward();
    });
  }

  signInAnimInit(controller) {
    signInController = controller;
    signInController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 2100), () {
      signInController.forward();
    });
  }

  signUpAnimInit(controller) {
    signUpController = controller;
    signUpController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 2600), () {
      signUpController.forward();
    });
  }

  checkIsEmailFocused() {
    if (loginFocusNode.hasFocus) {
      containerHeight.value = Get.height - Get.statusBarHeight - 30;
      containerBorderRadius.value = 0;
      logoOpacity.value = 0;
    } else {
      containerHeight.value = 567;
      containerBorderRadius.value = 36;
      logoOpacity.value = 1;
    }
  }

  checkIsPassFocused() {
    if (passwordFocusNode.hasFocus) {
      containerHeight.value = Get.height - Get.statusBarHeight - 30;
      containerBorderRadius.value = 0;
      logoOpacity.value = 0;
    } else {
      containerHeight.value = 567;
      containerBorderRadius.value = 36;
      logoOpacity.value = 1;
    }
  }
}
