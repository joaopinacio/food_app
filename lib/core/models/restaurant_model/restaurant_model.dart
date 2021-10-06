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
    required UserModel user,
    List<ProductModel>? listProducts,
  }) : super(
          uid: uid,
          name: name,
          primaryColor: primaryColor,
          logo: logo,
          primaryImage: primaryImage,
          rate: rate,
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
      user: UserModel.init(),
      listProducts: <ProductModel>[],
    );
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      primaryColor: json['primaryColor'] ?? '',
      logo: json['logo'] ?? ImageModel.init(),
      primaryImage: json['primaryImage'] ?? ImageModel.init(),
      rate: json['rate'] ?? 0.0,
      user: json['user'] ?? UserModel.init(),
      listProducts: json['listProducts'] ?? <ProductModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'primaryColor': primaryColor,
      'logo': logo,
      'primaryImage': primaryImage,
      'rate': rate,
      'user': user,
      'listProducts': listProducts,
    };
  }
}
