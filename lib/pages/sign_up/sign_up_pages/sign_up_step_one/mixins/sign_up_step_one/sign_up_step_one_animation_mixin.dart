import 'package:flutter/animation.dart';
import 'package:get/get.dart';

mixin SignUpStepOneAnimationMixin on GetxController {
  late AnimationController textAnimController;
  late AnimationController firstNameAnimController;
  late AnimationController lastNameAnimController;

  textAnimInit(controller) {
    textAnimController = controller;
    textAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      textAnimController.forward();
    });
  }

  firstNameAnimInit(controller) {
    firstNameAnimController = controller;
    firstNameAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      firstNameAnimController.forward();
    });
  }

  lastNameAnimInit(controller) {
    lastNameAnimController = controller;
    lastNameAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      lastNameAnimController.forward();
    });
  }

  forwardAllAnimation() {
    textAnimController.forward();
    firstNameAnimController.forward();
    lastNameAnimController.forward();
  }

  reverseAllAnimation() {
    textAnimController.reverse();
    firstNameAnimController.reverse();
    lastNameAnimController.reverse();
  }
}
