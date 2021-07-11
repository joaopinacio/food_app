import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => SplashPageController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
