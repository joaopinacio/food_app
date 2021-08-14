import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'login_page_controller.dart';

class LoginPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
      () => LoginPageController(
        appPages: Get.find(),
        authController: Get.find(),
      ),
      fenix: true,
    );
  }

  @override
  void registerRepositories() {}
}
