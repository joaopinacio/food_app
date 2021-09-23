import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/medium/app_restaurant_menu_type_card/app_restaurant_menu_type_card_component.dart';

class AppRestaurantMenuTypeCardStyles {
  AppRestaurantMenuTypeCardStyles._();

  /// ## AppRestaurantMenuTypeCardStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[image]__ imagem do card (icone)
  ///
  static AppRestaurantMenuTypeCardComponent standard({
    required Behaviour behaviour,
    required String title,
    String? image,
  }) =>
      AppRestaurantMenuTypeCardComponent(
        behaviour: behaviour,
        title: title,
        image: image,
      );
}
