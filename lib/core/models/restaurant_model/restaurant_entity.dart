import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/models/user_model/user_model.dart';

abstract class RestaurantEntity {
  String uid;
  String name;
  String primaryColor;
  ImageModel logo;
  ImageModel primaryImage;
  num rate;
  String restaurantType;
  UserModel user;
  List<ProductModel>? listProducts;

  RestaurantEntity({
    required this.uid,
    required this.name,
    required this.primaryColor,
    required this.logo,
    required this.primaryImage,
    required this.rate,
    required this.restaurantType,
    required this.user,
    this.listProducts,
  });
}
