import 'package:food_app/pages/restaurants/restaurant_pages/restaurant_edit_page/restaurant_edit_page_controller.dart';
import 'package:get/get.dart';

class ProductsPageController extends GetxController {
  final RestaurantEditController _restaurantEditController;

  ProductsPageController({required RestaurantEditController restaurantEditController})
      : _restaurantEditController = restaurantEditController;
}
