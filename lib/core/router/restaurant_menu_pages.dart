import 'package:food_app/pages/restaurant_menu/restaurant_menu_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_page_bindings.dart';
import 'package:get/get.dart';

mixin RestaurantMenuPages {
  final restaurantMenu = '/restaurant_menu';

  get restaurantMenuPage => GetPage(
        name: restaurantMenu,
        page: () => RestaurantMenuPage(),
        binding: RestaurantMenuPageBindings(),
        transition: Transition.cupertino,
      );

  List<GetPage<dynamic>> get getRestaurantMenuPagesList => [
        restaurantMenuPage,
      ];
}
