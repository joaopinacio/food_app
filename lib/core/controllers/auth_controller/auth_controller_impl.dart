import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:food_app/core/models/user_model/user_model.dart';

import 'package:food_app/core/repositories/auth_repository/auth_repository.dart';
import 'package:food_app/core/repositories/user_repository/user_repository_interface.dart';
import 'package:food_app/core/utils/app_uuid.dart';

import 'auth_controller.dart';

class AuthControllerImpl implements IAuthController {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  AuthControllerImpl({
    required IAuthRepository authRepository,
    required IUserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      var encryptedPassword = (md5.convert(utf8.encode('FIRESTORE${email.toLowerCase()}PASS$password'))).toString();

      var result = await _authRepository.signIn(email: email, password: encryptedPassword);

      // if (result != null) {

      // } else {

      // }

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
      var result;
      var userModel = UserModel(uid: AppUuid.generateUuid(), email: email, password: password, userType: 'free_user');
      var encryptedPassword = (md5.convert(utf8.encode('FIRESTORE${email.toLowerCase()}PASS$password'))).toString();

      var firebaseUser = await _authRepository.signUp(email: email, password: encryptedPassword);

      if (firebaseUser != null) {
        result = await _userRepository.saveUser(data: userModel);
      }

      print('🟩 AuthControllerImpl.signUp -> $result');
      return true;
    } catch (e) {
      print('🟥 AuthControllerImpl.signOut -> $e');
      return false;
    }
  }
}
