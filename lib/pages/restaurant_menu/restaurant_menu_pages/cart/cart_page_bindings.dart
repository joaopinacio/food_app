import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'cart_page_controller.dart';

class CartPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
        () => CartPageController(
              restaurantMenuPageController: Get.find(),
            ),
        fenix: true);
  }

  @override
  void registerRepositories() {}
}
