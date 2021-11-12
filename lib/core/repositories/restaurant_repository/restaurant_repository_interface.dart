import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';

abstract class IRestaurantRepository {
  Future<RestaurantModel?> getRestaurantByUser(String userUid);
  Stream<List<RestaurantModel>>? getRestaurants();
  Future<List<RestaurantModel>>? getRestaurantsOnce();
  Future<bool> saveRestaurant(
      {required RestaurantModel data, required ImageModel primaryImageModel, required ImageModel logoImageModel});
  Future<bool>? deleteRestaurant({required RestaurantModel data});
}
