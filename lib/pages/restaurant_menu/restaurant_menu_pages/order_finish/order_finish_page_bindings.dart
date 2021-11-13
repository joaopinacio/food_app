import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'order_finish_page_controller.dart';

class OrderFinishPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(
        () => OrderFinishPageController(
              appPages: Get.find(),
            ),
        fenix: true);
  }

  @override
  void registerRepositories() {}
}
