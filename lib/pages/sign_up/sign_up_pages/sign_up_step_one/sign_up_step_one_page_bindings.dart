import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'sign_up_step_one_page_controller.dart';

class SignUpStepOnePageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => SignUpStepOnePageController(signUpPageController: Get.find()), fenix: true);
  }

  @override
  void registerRepositories() {}
}
