import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  HomePageController();

  goToAddRestaurant() {
    Get.toNamed(AppPages.instance.restaurantAdd, arguments: {'fromSignUp': false});
  }
}
