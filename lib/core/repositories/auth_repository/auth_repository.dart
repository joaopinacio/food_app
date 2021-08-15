import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> signIn({required String email, required String password});
  Future<User?> signUp({required String email, required String password});
  Future<bool> signOut();
  User? get firebaseUser;
}
