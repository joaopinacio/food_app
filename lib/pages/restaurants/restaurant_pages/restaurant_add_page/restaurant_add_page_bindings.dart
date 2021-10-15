import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'restaurant_add_page_controller.dart';

class RestaurantAddPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => RestaurantAddController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
