import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/sign_up/sign_up_page_controller.dart';
import 'package:get/get.dart';

import 'mixins/sign_up_step_two_animation_mixin.dart';

class SignUpStepTwoPageController extends GetxController with SignUpStepTwoAnimationMixin {
  final SignUpPageController _signUpPageController;

  SignUpStepTwoPageController({required SignUpPageController signUpPageController})
      : _signUpPageController = signUpPageController;

  var emailKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailFocusNode = FocusNode();

  SignUpPageController get getSignUpPageController => _signUpPageController;

  String? validatorEmail(String? value) {
    var text = value ?? '';
    var validEmail = AppUtil.emailValidator(text);

    if (text == '') {
      emailFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else if (validEmail != '') {
      return validEmail;
    } else {
      return null;
    }
  }

  toStepThree() async {
    if (emailKey.currentState!.validate()) {
      _signUpPageController.goTo.value = 2;
      _signUpPageController.user.email = emailController.text;

      reverseAllAnimation();
      await Future.delayed(Duration(milliseconds: 800), () async {
        await Get.toNamed(_signUpPageController.getAppPages.signUpStepThree);
        forwardAllAnimation();
      });
    }
  }

  goBack() {
    _signUpPageController.goTo.value = 0;
    textAnimController.reverse();
    emailAnimController.reverse();
    Future.delayed(Duration(milliseconds: 800), () {
      Get.back();
    });
  }
}
