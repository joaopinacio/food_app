import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/models/user_model/user_model.dart';

import 'restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    required String uid,
    required String name,
    required String primaryColor,
    required ImageModel logo,
    required ImageModel primaryImage,
    required num rate,
    required String restaurantType,
    required UserModel user,
    List<ProductModel>? listProducts,
  }) : super(
          uid: uid,
          name: name,
          primaryColor: primaryColor,
          logo: logo,
          primaryImage: primaryImage,
          rate: rate,
          restaurantType: restaurantType,
          user: user,
          listProducts: listProducts,
        );

  static RestaurantModel init() {
    return RestaurantModel(
      uid: '',
      name: '',
      primaryColor: '',
      logo: ImageModel.init(),
      primaryImage: ImageModel.init(),
      rate: 0.0,
      restaurantType: '',
      user: UserModel.init(),
      listProducts: <ProductModel>[],
    );
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> listProducts = [];
    var listProductsModel = json['listProducts'] as List;
    listProducts = listProductsModel.map((product) => ProductModel.fromJson(product)).toList();

    return RestaurantModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      primaryColor: json['primaryColor'] ?? '',
      logo: ImageModel.fromJson(json['logo']),
      primaryImage: ImageModel.fromJson(json['primaryImage']),
      rate: json['rate'] ?? 0.0,
      restaurantType: json['restaurantType'] ?? '',
      user: UserModel.fromJson(json['user']),
      listProducts: listProducts,
    );
  }

  Map<String, dynamic> toJson() {
    var listProductsJson = listProducts!.map((product) => product.toJson()).toList();

    return {
      'uid': uid,
      'name': name,
      'primaryColor': primaryColor,
      'logo': logo.toJson(),
      'primaryImage': primaryImage.toJson(),
      'rate': rate,
      'restaurantType': restaurantType,
      'user': user.toJson(),
      'listProducts': listProductsJson,
    };
  }
}
