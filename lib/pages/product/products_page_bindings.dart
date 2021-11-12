import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'products_page_controller.dart';

class ProductsPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
        () => ProductsPageController(
              restaurantEditController: Get.find(),
            ),
        fenix: true);
  }

  @override
  void registerRepositories() {}
}
