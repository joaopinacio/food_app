import 'package:food_app/core/classes/core_bindings.dart';
import 'package:get/get.dart';

import 'camera_page_controller.dart';

class CameraPageBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerControllers() {
    Get.lazyPut(() => CameraPageController(), fenix: true);
  }

  @override
  void registerRepositories() {}
}
