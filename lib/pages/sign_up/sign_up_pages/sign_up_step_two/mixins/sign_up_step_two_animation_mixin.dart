import 'package:flutter/animation.dart';
import 'package:get/get.dart';

mixin SignUpStepTwoAnimationMixin on GetxController {
  late AnimationController textAnimController;
  late AnimationController emailAnimController;

  textAnimInit(controller) {
    textAnimController = controller;
    textAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      textAnimController.forward();
    });
  }

  emailAnimInit(controller) {
    emailAnimController = controller;
    emailAnimController.duration = Duration(milliseconds: 800);
    Future.delayed(Duration(milliseconds: 250), () {
      emailAnimController.forward();
    });
  }

  forwardAllAnimation() {
    textAnimController.forward();
    emailAnimController.forward();
  }

  reverseAllAnimation() {
    textAnimController.reverse();
    emailAnimController.reverse();
  }
}
