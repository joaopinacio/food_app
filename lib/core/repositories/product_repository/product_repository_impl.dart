import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/repositories/camera_repository/camera_repository.dart';

import 'product_repository_interface.dart';

class ProductRepositoryImpl implements IProductRepository {
  final FirebaseFirestore firestore;
  final ICameraRepository cameraRepository;
  CollectionReference<Map<String, dynamic>> get productCollection => firestore.collection('products');

  ProductRepositoryImpl({required this.firestore, required this.cameraRepository});

  @override
  Stream<List<ProductModel>>? getProducts() {
    try {
      return productCollection.snapshots().map((snapshots) {
        return snapshots.docs.map((doc) {
          return ProductModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ProductRepositoryImpl.getProducts -> $e');
      return null;
    }
  }

  @override
  Stream<List<ProductModel>>? getProductsByRestaurant({required String restaurantUid}) {
    try {
      return productCollection.where('restaurantUid', isEqualTo: restaurantUid).snapshots().map((snapshots) {
        return snapshots.docs.map((doc) {
          return ProductModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ProductRepositoryImpl.getProducts -> $e');
      return null;
    }
  }

  @override
  Future<List<ProductModel>>? getProductsOnce() {
    try {
      return productCollection.get().then((snapshot) {
        return snapshot.docs.map((doc) {
          return ProductModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ProductRepositoryImpl.getProductsOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool>? saveProduct({
    required ProductModel data,
    required ImageModel imageModel,
  }) async {
    try {
      if ((imageModel.hashMd5 != null && imageModel.hashMd5?.isNotEmpty == true)) {
        final loadImage = await cameraRepository.sendImageToStorage(
          hashMD5: imageModel.hashMd5,
          mimeImage: imageModel.mimeImage,
          image: imageModel.imageFile,
        );

        if (loadImage.isNotEmpty) {
          imageModel.url = loadImage;
          data.image = imageModel;
        } else {
          return false;
        }
      }

      await productCollection.doc(data.uid).set(data.toJson(), SetOptions(merge: true)).timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ProductRepositoryImpl.saveProduct -> $e');
      return false;
    }
  }

  @override
  Future<bool>? deleteProduct({
    required ProductModel data,
  }) async {
    try {
      await productCollection.doc(data.uid).delete().timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ProductRepositoryImpl.deleteProduct -> $e');
      return false;
    }
  }
}
