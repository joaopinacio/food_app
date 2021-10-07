import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'sign_up_step_two' '_page_controller.dart';

class SignUpStepTwoPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => SignUpStepTwoPageController(signUpPageController: Get.find()), fenix: true);
  }

  @override
  void registerRepositories() {}
}
