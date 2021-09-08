import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';

import 'restaurant_repository_interface.dart';

class RestaurantRepositoryImpl implements IRestaurantRepository {
  final FirebaseFirestore firestore;
  CollectionReference<Map<String, dynamic>> get restaurantCollection => firestore.collection('restaurants');

  RestaurantRepositoryImpl({required this.firestore});

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
  Future<bool>? saveRestaurant({
    required RestaurantModel data,
  }) async {
    try {
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
