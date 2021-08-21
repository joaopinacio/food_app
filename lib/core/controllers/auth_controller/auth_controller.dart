import 'package:food_app/core/models/auth_model/auth_model.dart';

abstract class IAuthController {
  Future<AuthModel> signIn({required String email, required String password});
  Future<bool> signOut();
  Future<bool> signUp({required String email, required String password});
}
