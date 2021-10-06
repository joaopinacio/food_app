import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/sign_up/sign_up_page_controller.dart';
import 'package:get/get.dart';

class SignUpStepOnePageController extends GetxController {
  final SignUpPageController _signUpPageController;

  SignUpStepOnePageController({required SignUpPageController signUpPageController})
      : _signUpPageController = signUpPageController;

  var firstNameKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var firstNameFocusNode = FocusNode();
  var lastNameKey = GlobalKey<FormState>();
  var lastNameController = TextEditingController();
  var lastNameFocusNode = FocusNode();

  var goTo = 0.0.obs;

  double get getGoTo => goTo.value;

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

  toStepTwo() {
    if (firstNameKey.currentState!.validate()) {
      if (lastNameKey.currentState!.validate()) {
        goTo.value = 1;
        _signUpPageController.user.firstName = firstNameController.text;
        _signUpPageController.user.lastName = lastNameController.text;
        // Get.toNamed(_signUpPageController.getAppPages.signUpStepTwo);
      }
    }
  }

  toLoginPage() {
    Get.back();
    Get.back();
  }
}
