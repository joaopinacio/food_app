import 'package:food_app/core/models/image_model/image_model.dart';

abstract class RestaurantEntity {
  String uid;
  String name;
  String primaryColor;
  ImageModel logo;
  ImageModel primaryImage;
  num rate;

  RestaurantEntity({
    required this.uid,
    required this.name,
    required this.primaryColor,
    required this.logo,
    required this.primaryImage,
    required this.rate,
  });
}
