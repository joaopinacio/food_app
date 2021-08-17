import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

import 'mixins/login_animation_mixin.dart';

class LoginPageController extends GetxController with LoginAnimationsMixin {
  final AppPages _appPages;
  final IAuthController _authController;
  // final IUserRepository _userRepository;

  LoginPageController({
    required AppPages appPages,
    required IAuthController authController,
    // required IUserRepository userRepository,
  })  : _appPages = appPages,
        _authController = authController {
    // _userRepository = userRepository {
    init();
  }

  var loginController = TextEditingController();
  var loginKey = UniqueKey();
  var passwordController = TextEditingController();
  var passwordKey = UniqueKey();

  init() {
    initAnimations();
    inputListeners();
  }

  inputListeners() {
    loginFocusNode.addListener(() {
      checkIsEmailFocused();
    });

    passwordFocusNode.addListener(() {
      checkIsPassFocused();
    });
  }

  login() {}

  signUpTest() {
    _authController.signUp(email: loginController.text, password: passwordController.text);
  }

  // Teste de pegar todos os usuarios numa stream
  // late StreamSubscription _usersStream;
  // var _usersList = <UserModel>[].obs;
  // getUsersTest() {
  //   _usersStream = _userRepository.getUsers()!.listen(_listenUsersStream);
  // }

  // _listenUsersStream(List<UserModel> list) {
  //   _usersList.value = list;
  //   print(_usersList.length);
  // }

  // @override
  // void onClose() {
  //   _usersStream.cancel();
  // }
}
