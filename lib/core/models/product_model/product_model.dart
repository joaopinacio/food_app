import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

import 'product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String uid,
    required String name,
    required String description,
    required num price,
    num? oldPrice,
    required ImageModel image,
    ProductTypeModel? productType,
    String? restaurantUid,
  }) : super(
          uid: uid,
          name: name,
          description: description,
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
      description: '',
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
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      oldPrice: json['oldPrice'] ?? 0,
      image: ImageModel.fromJson(json['image']),
      productType: ProductTypeModel.fromJson(json['productType']),
      restaurantUid: json['restaurantUid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'image': image.toJson(),
      'productType': productType!.toJson(),
      'restaurantUid': restaurantUid,
    };
  }
}
