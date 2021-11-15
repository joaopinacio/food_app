import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/medium/app_restaurant_menu_product_card/app_restaurant_menu_product_card_component.dart';

class AppRestaurantMenuProductCardStyles {
  AppRestaurantMenuProductCardStyles._();

  /// ## AppRestaurantMenuTypeCardStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo do card (nome do produto)
  ///
  /// __[image]__ imagem do produto
  ///
  /// __[description]__ Subtitulo do card (descricao do produto)
  ///
  /// __[price]__ Preco do produto
  ///
  /// __[oldPrice]__ Antigo preco do produto (desconto)
  ///
  static AppRestaurantMenuProductCardComponent standard({
    required Behaviour behaviour,
    required String title,
    String? image,
    required String description,
    required String price,
    String? oldPrice,
    required Function() onTap,
    required bool inCart,
    required int listGridLength,
  }) =>
      AppRestaurantMenuProductCardComponent(
        behaviour: behaviour,
        title: title,
        image: image,
        description: description,
        price: price,
        oldPrice: oldPrice,
        onTap: onTap,
        inCart: inCart,
        listGridLength: listGridLength,
      );
}
