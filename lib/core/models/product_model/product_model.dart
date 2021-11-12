import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

import 'product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String uid,
    required String name,
    required num price,
    num? oldPrice,
    required ImageModel image,
    ProductTypeModel? productType,
    String? restaurantUid,
  }) : super(
          uid: uid,
          name: name,
          price: price,
          oldPrice: oldPrice,
          image: image,
          productType: productType,
          restaurantUid: restaurantUid,
        );

  static ProductModel init() {
    return ProductModel(
      uid: '',
      name: '',
      price: 0,
      oldPrice: 0,
      image: ImageModel.init(),
      productType: ProductTypeModel.init(),
      restaurantUid: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      oldPrice: json['oldPrice'] ?? 0,
      image: json['image'] ?? ImageModel.init(),
      productType: json['productType'] ?? ProductTypeModel.init(),
      restaurantUid: json['restaurantUid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'image': image,
      'productType': productType,
      'restaurantUid': restaurantUid,
    };
  }
}
