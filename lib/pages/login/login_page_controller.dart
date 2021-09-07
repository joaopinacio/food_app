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

    loginController.text = 'joao@gmail.com';
    passwordController.text = '123456';
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

    if (getLoginErrorLabel != '') {
      loginFocusNode.requestFocus();
      return getLoginErrorLabel;
    } else {
      loginErrorLabel.value = AppUtil.emailValidator(email) ?? '';
      return getLoginErrorLabel == '' ? null : getLoginErrorLabel;
    }
  }

  String? validatorPassowrd(String? value) {
    var password = value ?? '';

    if (getPasswordErrorLabel != '') {
      passwordFocusNode.requestFocus();
      return getPasswordErrorLabel;
    } else {
      passwordErrorLabel.value = AppUtil.passwordValidator(password) ?? '';
      return getPasswordErrorLabel == '' ? null : getPasswordErrorLabel;
    }
  }

  login() async {
    if (!loginKey.currentState!.validate()) {
      loginErrorLabel.value = '';
    } else if (!passwordKey.currentState!.validate()) {
      passwordErrorLabel.value = '';
    } else {
      AppLoading.loading();
      var result = await _authController.signIn(email: loginController.text, password: passwordController.text);
      Get.back();

      if (result.success!) {
        // Get.toNamed(_appPages.home);
        Get.offNamedUntil(_appPages.home, (route) => false);
      } else {
        switch (result.errorType) {
          case 'user-not-found':
            loginErrorLabel.value = 'email_not_found'.tr;
            loginKey.currentState!.validate();
            break;
          case 'wrong-password':
            passwordErrorLabel.value = 'wrong_password'.tr;
            passwordKey.currentState!.validate();
            break;
          default:
            print("Generic error");
            break;
        }
      }
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
