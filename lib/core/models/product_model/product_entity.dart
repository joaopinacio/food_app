import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

abstract class ProductEntity {
  String uid;
  String name;
  num price;
  num? oldPrice;
  ImageModel image;
  ProductTypeModel? productType;

  ProductEntity({
    required this.uid,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.image,
    this.productType,
  });
}
