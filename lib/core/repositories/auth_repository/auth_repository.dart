import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/auth_model/auth_model.dart';

abstract class IAuthRepository {
  Future<AuthModel> signIn({required String email, required String password});
  Future<User?> signUp({required String email, required String password});
  Future<bool> signOut();
  User? get firebaseUser;
}
