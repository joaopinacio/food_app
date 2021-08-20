import 'package:flutter/material.dart';
import 'package:food_app/core/auxiliary_widgets/app_loading.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
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
  var loginKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordKey = GlobalKey<FormState>();
  var loginErrorLabel = ''.obs;
  var passwordErrorLabel = ''.obs;

  get getLoginErrorLabel => loginErrorLabel.value;
  get getPasswordErrorLabel => passwordErrorLabel.value;

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

  String? validatorEmail(String? value) {
    var email = value ?? '';
    loginErrorLabel.value = AppUtil.emailValidator(email) ?? '';

    if (getLoginErrorLabel != '') {
      loginFocusNode.requestFocus();
      return getLoginErrorLabel;
    }

    return null;
  }

  String? validatorPassowrd(String? value) {
    var password = value ?? '';
    passwordErrorLabel.value = AppUtil.passwordValidator(password) ?? '';

    if (getPasswordErrorLabel != '') {
      passwordFocusNode.requestFocus();
      return getPasswordErrorLabel;
    }

    return null;
  }

  login() async {
    if (!loginKey.currentState!.validate()) {
      loginErrorLabel.value = '';
    } else if (!passwordKey.currentState!.validate()) {
      passwordErrorLabel.value = '';
    } else {
      AppLoading.loading();
      await _authController.signIn(email: loginController.text, password: passwordController.text);
      Get.back();
    }
  }

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

  @override
  void onClose() {
    loginFocusNode.dispose();
    loginController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }
}
