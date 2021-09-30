import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/models/product_type_model/product_type_model.dart';

import 'product_type_repository_interface.dart';

class ProductTypeRepositoryImpl implements IProductTypeRepository {
  final FirebaseFirestore firestore;
  CollectionReference<Map<String, dynamic>> get productTypeCollection => firestore.collection('product_types');

  ProductTypeRepositoryImpl({required this.firestore});

  @override
  Stream<List<ProductTypeModel>>? getProductTypes() {
    try {
      return productTypeCollection.snapshots().map((snapshots) {
        return snapshots.docs.map((doc) {
          return ProductTypeModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ProductTypeRepositoryImpl.getProductTypes -> $e');
      return null;
    }
  }

  @override
  Future<List<ProductTypeModel>>? getProductTypesOnce() {
    try {
      return productTypeCollection.get().then((snapshot) {
        return snapshot.docs.map((doc) {
          return ProductTypeModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ProductTypeRepositoryImpl.getProductTypesOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool>? saveProductType({
    required ProductTypeModel data,
  }) async {
    try {
      await productTypeCollection.doc(data.uid).set(data.toJson(), SetOptions(merge: true)).timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ProductTypeRepositoryImpl.saveProductType -> $e');
      return false;
    }
  }

  @override
  Future<bool>? deleteProductType({
    required ProductTypeModel data,
  }) async {
    try {
      await productTypeCollection.doc(data.uid).delete().timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ProductTypeRepositoryImpl.deleteProductType -> $e');
      return false;
    }
  }
}
