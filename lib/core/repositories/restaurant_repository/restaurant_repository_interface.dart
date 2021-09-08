import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';

abstract class IRestaurantRepository {
  Stream<List<RestaurantModel>>? getRestaurants();
  Future<List<RestaurantModel>>? getRestaurantsOnce();
  Future<bool>? saveRestaurant({required RestaurantModel data});
  Future<bool>? deleteRestaurant({required RestaurantModel data});
}
