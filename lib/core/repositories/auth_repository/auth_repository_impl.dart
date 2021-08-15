import 'package:firebase_auth/firebase_auth.dart';

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
  Future<User?> signIn({required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('🟥 AuthRepositoryImpl.signIn -> $e');
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
    } catch (e) {
      print('🟥 AuthRepositoryImpl.signUp -> $e');
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
