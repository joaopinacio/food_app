import 'package:food_app/pages/restaurants/restaurant_pages/restaurant_add_page/restaurant_add_page.dart';
import 'package:food_app/pages/restaurants/restaurant_pages/restaurant_add_page/restaurant_add_page_bindings.dart';
import 'package:get/get.dart';

mixin RestaurantPages {
  final restaurantAdd = '/restaurant_add';
  final restaurantEdit = '/restaurant_edit';

  get restaurantAddPage => GetPage(
        name: restaurantAdd,
        page: () => RestaurantAddPage(),
        binding: RestaurantAddPageBindings(),
        transition: Transition.fadeIn,
      );

  List<GetPage<dynamic>> get getRestaurantPagesList => [
        restaurantAddPage,
      ];
}
