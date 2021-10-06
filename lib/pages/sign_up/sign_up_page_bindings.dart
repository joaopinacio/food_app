import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'sign_up_page_controller.dart';

class SignUpPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => SignUpPageController(appPages: Get.find()), fenix: true);
  }

  @override
  void registerRepositories() {}
}
