import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/medium/app_restaurant_menu_product_card/app_restaurant_menu_product_card_component.dart';

class AppRestaurantMenuProductCardStyles {
  AppRestaurantMenuProductCardStyles._();

  /// ## AppRestaurantMenuTypeCardStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  static AppRestaurantMenuProductCardComponent standard({
    required Behaviour behaviour,
  }) =>
      AppRestaurantMenuProductCardComponent(
        behaviour: behaviour,
      );
}
