import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

import 'product_cart_entity.dart';

class ProductCartModel extends ProductCartEntity {
  ProductCartModel({
    required String uid,
    required String name,
    required num price,
    num? oldPrice,
    required ImageModel image,
    ProductTypeModel? productType,
    String? restaurantUid,
    required int qty,
    required num total,
  }) : super(
          uid: uid,
          name: name,
          price: price,
          oldPrice: oldPrice,
          image: image,
          productType: productType,
          restaurantUid: restaurantUid,
          qty: qty,
          total: total,
        );

  static ProductCartModel init() {
    return ProductCartModel(
      uid: '',
      name: '',
      price: 0,
      oldPrice: 0,
      image: ImageModel.init(),
      productType: ProductTypeModel.init(),
      restaurantUid: '',
      qty: 0,
      total: 0,
    );
  }

  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      oldPrice: json['oldPrice'] ?? 0,
      image: ImageModel.fromJson(json['image']),
      productType: ProductTypeModel.fromJson(json['productType']),
      restaurantUid: json['restaurantUid'] ?? '',
      qty: json['qty'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'image': image.toJson(),
      'productType': productType!.toJson(),
      'restaurantUid': restaurantUid,
      'qty': qty,
      'total': total,
    };
  }
}
