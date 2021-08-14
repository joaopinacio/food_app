import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:food_app/core/repositories/auth_repository/auth_repository.dart';

import 'auth_controller.dart';

class AuthControllerImpl implements AuthController {
  final AuthRepository _authRepository;

  AuthControllerImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      var encryptedPassword = (md5.convert(utf8.encode('FIRESTORE${email.toLowerCase()}PASS$password'))).toString();

      var result = await _authRepository.signIn(email: email, password: encryptedPassword);

      print('🟩 AuthControllerImpl.signIn -> $result');
      return true;
    } catch (e) {
      print('🟥 AuthControllerImpl.signIn -> $e');
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      var result = await _authRepository.signOut();
      return result;
    } catch (e) {
      print('🟥 AuthControllerImpl.signOut -> $e');
      return false;
    }
  }

  @override
  Future<bool> signUp({required String email, required String password}) async {
    try {
      var encryptedPassword = (md5.convert(utf8.encode('FIRESTORE${email.toLowerCase()}PASS$password'))).toString();

      var result = await _authRepository.signUp(email: email, password: encryptedPassword);

      print('🟩 AuthControllerImpl.signUp -> $result');
      return true;
    } catch (e) {
      print('🟥 AuthControllerImpl.signOut -> $e');
      return false;
    }
  }
}
