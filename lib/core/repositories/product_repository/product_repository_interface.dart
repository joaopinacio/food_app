import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';

abstract class IProductRepository {
  Stream<List<ProductModel>>? getProducts();
  Future<List<ProductModel>>? getProductsOnce();
  Future<bool>? saveProduct({required ProductModel data, required ImageModel imageModel});
  Future<bool>? deleteProduct({required ProductModel data});
}
