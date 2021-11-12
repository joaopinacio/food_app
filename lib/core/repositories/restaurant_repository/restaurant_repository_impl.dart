import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/repositories/camera_repository/camera_repository.dart';

import 'restaurant_repository_interface.dart';

class RestaurantRepositoryImpl implements IRestaurantRepository {
  final FirebaseFirestore firestore;
  final ICameraRepository cameraRepository;
  CollectionReference<Map<String, dynamic>> get restaurantCollection => firestore.collection('restaurants');

  RestaurantRepositoryImpl({required this.firestore, required this.cameraRepository});

  @override
  Future<RestaurantModel?> getRestaurantByUser(String userUid) async {
    try {
      var restaurantList = await restaurantCollection.get().then((snapshot) {
        return snapshot.docs.map((doc) {
          return RestaurantModel.fromJson(doc.data());
        }).toList();
      });

      return restaurantList.singleWhere(
        (restaurant) => restaurant.user.uid == userUid,
        orElse: () => RestaurantModel.init(),
      );
    } catch (e) {
      print('🟥 ResturantRepositoryImpl.getRestaurants -> $e');
      return null;
    }
  }

  @override
  Stream<List<RestaurantModel>>? getRestaurants() {
    try {
      return restaurantCollection.snapshots().map((snapshots) {
        return snapshots.docs.map((doc) {
          return RestaurantModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ResturantRepositoryImpl.getRestaurants -> $e');
      return null;
    }
  }

  @override
  Future<List<RestaurantModel>>? getRestaurantsOnce() {
    try {
      return restaurantCollection.get().then((snapshot) {
        return snapshot.docs.map((doc) {
          return RestaurantModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 ResturantRepositoryImpl.getRestaurantsOnce -> $e');
      return null;
    }
  }

  @override
  Future<bool> saveRestaurant({
    required RestaurantModel data,
    required ImageModel primaryImageModel,
    required ImageModel logoImageModel,
  }) async {
    try {
      if ((primaryImageModel.hashMd5 != null && primaryImageModel.hashMd5?.isNotEmpty == true) &&
          (logoImageModel.hashMd5 != null && logoImageModel.hashMd5?.isNotEmpty == true)) {
        final loadPrimaryImage = await cameraRepository.sendImageToStorage(
          hashMD5: primaryImageModel.hashMd5,
          mimeImage: primaryImageModel.mimeImage,
          image: primaryImageModel.imageFile,
        );

        final loadLogoImage = await cameraRepository.sendImageToStorage(
          hashMD5: logoImageModel.hashMd5,
          mimeImage: logoImageModel.mimeImage,
          image: logoImageModel.imageFile,
        );

        if (loadPrimaryImage.isNotEmpty && loadLogoImage.isNotEmpty) {
          primaryImageModel.url = loadPrimaryImage;
          logoImageModel.url = loadLogoImage;
          data.primaryImage = primaryImageModel;
          data.logo = logoImageModel;
        } else {
          return false;
        }
      }

      await restaurantCollection.doc(data.uid).set(data.toJson(), SetOptions(merge: true)).timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ResturantRepositoryImpl.saveRestaurant -> $e');
      return false;
    }
  }

  @override
  Future<bool>? deleteRestaurant({
    required RestaurantModel data,
  }) async {
    try {
      await restaurantCollection.doc(data.uid).delete().timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 ResturantRepositoryImpl.deleteRestaurant -> $e');
      return false;
    }
  }
}
