import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_cart_model/product_cart_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

import 'cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required String uid,
    required List<ProductCartModel> productsCart,
    required num qty,
    required num total,
  }) : super(
          uid: uid,
          productsCart: productsCart,
          qty: qty,
          total: total,
        );

  static CartModel init() {
    return CartModel(
      uid: '',
      productsCart: <ProductCartModel>[],
      qty: 0,
      total: 0,
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    List<ProductCartModel> listProductsCart = [];
    var listProductsCartModel = json['productsCart'] as List;
    listProductsCart = listProductsCartModel.map((product) => ProductCartModel.fromJson(product)).toList();

    return CartModel(
      uid: json['uid'] ?? '',
      productsCart: listProductsCart,
      qty: json['qty'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    var listProductsCartJson = productsCart.map((product) => product.toJson()).toList();

    return {
      'uid': uid,
      'productsCart': listProductsCartJson,
      'qty': qty,
      'total': total,
    };
  }
}
