import 'package:food_app/core/models/product_cart_model/product_cart_model.dart';

abstract class CartEntity {
  String uid;
  List<ProductCartModel> productsCart;
  num qty;
  num total;

  CartEntity({
    required this.uid,
    required this.productsCart,
    required this.qty,
    required this.total,
  });
}
