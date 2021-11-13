import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class OrderFinishPageController extends GetxController {
  final AppPages _appPages;

  OrderFinishPageController({required AppPages appPages}) : _appPages = appPages;

  backToRestaurantsPage() {
    Get.until((route) => Get.currentRoute == _appPages.restaurants);
  }
}
