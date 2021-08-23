import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomePageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => HomePageController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
