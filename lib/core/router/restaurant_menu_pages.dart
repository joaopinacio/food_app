import 'package:food_app/pages/restaurant_menu/restaurant_menu_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_page_bindings.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_pages/cart/cart_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_pages/cart/cart_page_bindings.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_pages/order_finish/order_finish_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_pages/order_finish/order_finish_page_bindings.dart';
import 'package:get/get.dart';

mixin RestaurantMenuPages {
  final restaurantMenu = '/restaurant_menu';
  final cart = '/cart';
  final orderFinish = '/order_finish';

  get restaurantMenuPage => GetPage(
        name: restaurantMenu,
        page: () => RestaurantMenuPage(),
        binding: RestaurantMenuPageBindings(),
        transition: Transition.fadeIn,
      );

  get cartPage => GetPage(
        name: cart,
        page: () => CartPage(),
        binding: CartPageBindings(),
        transition: Transition.cupertino,
      );

  get orderFinishPage => GetPage(
        name: orderFinish,
        page: () => OrderFinishPage(),
        binding: OrderFinishPageBindings(),
        transition: Transition.cupertino,
      );

  List<GetPage<dynamic>> get getRestaurantMenuPagesList => [
        restaurantMenuPage,
        cartPage,
        orderFinishPage,
      ];
}
