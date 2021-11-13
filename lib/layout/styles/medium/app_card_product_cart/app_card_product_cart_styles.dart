import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/medium/app_card_product_cart/app_card_product_cart.dart';

typedef IntCallback(int);

class AppCardProductCartStyles {
  AppCardProductCartStyles._();

  static AppCardProductCartComponent standard({
    required Behaviour behaviour,
    required String name,
    required String totalPrice,
    required int productQty,
    required IntCallback onChangeQty,
    required Color mainColor,
    required Color iconsColor,
    required String imageUrl,
    required Function() onRemove,
  }) =>
      AppCardProductCartComponent(
        behaviour: behaviour,
        name: name,
        totalPrice: totalPrice,
        productQty: productQty,
        onChangeQty: onChangeQty,
        mainColor: mainColor,
        iconsColor: iconsColor,
        imageUrl: imageUrl,
        onRemove: onRemove,
      );
}
