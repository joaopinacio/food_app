import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/auth_model/auth_model.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final userCredentialsKey = 'userCredentials';

  @override
  User? get firebaseUser => _firebaseAuth.currentUser;

  @override
  Future<AuthModel> signIn({required String email, required String password}) async {
    var auth = AuthModel.init();
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      auth.user = userCredential.user;
      auth.success = true;

      return auth;
    } on FirebaseAuthException catch (e) {
      auth.errorType = e.code;
      auth.success = false;
      print('🟥 AuthRepositoryImpl.signIn -> $e');
      return auth;
    }
  }

  @override
  Future<User?> signUp({required String email, required password}) async {
    try {
      var userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password.toString());

      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      print('🟥 AuthRepositoryImpl.signUp -> ${e.code}');
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print('🟥 AuthRepositoryImpl.signOut -> $e');
      return false;
    }
  }
}
