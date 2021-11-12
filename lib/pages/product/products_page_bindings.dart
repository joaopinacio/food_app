import 'package:food_app/core/classes/core_bindings.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_impl.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_interface.dart';
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
              productRepository: Get.find(),
              restaurantEditController: Get.find(),
            ),
        fenix: true);
  }

  @override
  void registerRepositories() {
    Get.lazyPut<IProductRepository>(
      () => ProductRepositoryImpl(firestore: Get.find(), cameraRepository: Get.find()),
      fenix: true,
    );
  }
}
