import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/medium/app_product_card/app_product_card_component.dart';

class AppProductCardStyles {
  AppProductCardStyles._();

  static AppProductCardComponent standard({
    required Behaviour behaviour,
    required String name,
    required String price,
    String? oldPrice,
    required String imageUrl,
    required Function() onTap,
  }) =>
      AppProductCardComponent(
        behaviour: behaviour,
        name: name,
        price: price,
        oldPrice: oldPrice,
        imageUrl: imageUrl,
        onTap: onTap,
      );
}
