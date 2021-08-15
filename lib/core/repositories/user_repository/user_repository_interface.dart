import 'package:food_app/core/models/user_model/user_model.dart';

abstract class IUserRepository {
  Stream<List<UserModel>>? getUsers();
  Future<bool>? saveUser({required UserModel data});
  Future<bool>? deleteUser({required UserModel data});
}
