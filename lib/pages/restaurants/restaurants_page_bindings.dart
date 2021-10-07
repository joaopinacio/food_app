import 'package:food_app/core/classes/core_bindings.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_impl.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:get/get.dart';

import 'restaurants_page_controller.dart';

class RestaurantsPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerRepositories() {
    Get.lazyPut<IRestaurantRepository>(
      () => RestaurantRepositoryImpl(firestore: Get.find(), cameraRepository: Get.find()),
      fenix: true,
    );
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => RestaurantsPageController(restaurantRepository: Get.find(), appPages: Get.find()), fenix: true);
  }
}
