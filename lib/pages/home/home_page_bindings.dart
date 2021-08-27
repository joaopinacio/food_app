import 'package:food_app/core/classes/core_bindings.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_impl.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomePageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerRepositories() {
    Get.lazyPut<IRestaurantRepository>(
      () => RestaurantRepositoryImpl(firestore: Get.find()),
      fenix: true,
    );
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => HomePageController(restaurantRepository: Get.find()), fenix: true);
  }
}
