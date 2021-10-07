import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/sign_up/sign_up_page_controller.dart';
import 'package:get/get.dart';

import 'mixins/sign_up_step_one/sign_up_step_one_animation_mixin.dart';

class SignUpStepOnePageController extends GetxController with SignUpStepOneAnimationMixin {
  final SignUpPageController _signUpPageController;

  SignUpStepOnePageController({required SignUpPageController signUpPageController})
      : _signUpPageController = signUpPageController;

  var firstNameKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var firstNameFocusNode = FocusNode();
  var lastNameKey = GlobalKey<FormState>();
  var lastNameController = TextEditingController();
  var lastNameFocusNode = FocusNode();

  SignUpPageController get getSignUpPageController => _signUpPageController;

  String? validatorFirstName(String? value) {
    var text = value ?? '';

    if (text == '') {
      firstNameFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  String? validatorLastName(String? value) {
    var text = value ?? '';

    if (text == '') {
      lastNameFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  toStepTwo() async {
    if (firstNameKey.currentState!.validate()) {
      if (lastNameKey.currentState!.validate()) {
        _signUpPageController.goTo.value = 1;
        _signUpPageController.user.firstName = firstNameController.text;
        _signUpPageController.user.lastName = lastNameController.text;

        reverseAllAnimation();
        await Future.delayed(Duration(milliseconds: 800), () async {
          await Get.toNamed(_signUpPageController.getAppPages.signUpStepTwo);
          forwardAllAnimation();
        });
      }
    }
  }

  toLoginPage() {
    Get.back();
    Get.back();
  }
}
