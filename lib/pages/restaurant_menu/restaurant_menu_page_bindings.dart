import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'restaurant_menu_page_controller.dart';

class RestaurantMenuPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => RestaurantMenuPageController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
