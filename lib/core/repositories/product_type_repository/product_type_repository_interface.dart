import 'package:food_app/core/models/product_type_model/product_type_model.dart';

abstract class IProductTypeRepository {
  Stream<List<ProductTypeModel>>? getProductTypes();
  Future<List<ProductTypeModel>>? getProductTypesOnce();
  Future<bool>? saveProductType({required ProductTypeModel data});
  Future<bool>? deleteProductType({required ProductTypeModel data});
}
