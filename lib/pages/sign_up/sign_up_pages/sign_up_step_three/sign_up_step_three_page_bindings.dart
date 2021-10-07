import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'sign_up_step_three_page_controller.dart';

class SignUpStepThreePageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
      () => SignUpStepThreePageController(
        signUpPageController: Get.find(),
        authController: Get.find(),
      ),
      fenix: true,
    );
  }

  @override
  void registerRepositories() {}
}
