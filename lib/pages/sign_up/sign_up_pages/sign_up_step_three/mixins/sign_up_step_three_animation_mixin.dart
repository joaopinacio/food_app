import 'package:flutter/animation.dart';
import 'package:get/get.dart';

mixin SignUpStepThreeAnimationMixin on GetxController {
  late AnimationController textAnimController;
  late AnimationController passwordAnimController;
  late AnimationController confirmPasswordAnimController;

  textAnimInit(controller) {
    textAnimController = controller;
    textAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      textAnimController.forward();
    });
  }

  passwordAnimInit(controller) {
    passwordAnimController = controller;
    passwordAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      passwordAnimController.forward();
    });
  }

  confirmPasswordAnimInit(controller) {
    confirmPasswordAnimController = controller;
    confirmPasswordAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      confirmPasswordAnimController.forward();
    });
  }
}
