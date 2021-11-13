import 'package:food_app/core/models/cart_model/cart_model.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_page_controller.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  final RestaurantMenuPageController _restaurantMenuPageController;

  CartPageController({required RestaurantMenuPageController restaurantMenuPageController})
      : _restaurantMenuPageController = restaurantMenuPageController;

  RestaurantMenuPageController get getRestaurantMenuPageController => _restaurantMenuPageController;
  CartModel get getCart => _restaurantMenuPageController.getCart;

  String formatPrice(num value) {
    return AppUtil.formatMoney(value: value);
  }
}
