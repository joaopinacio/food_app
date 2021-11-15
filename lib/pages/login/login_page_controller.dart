import 'package:flutter/material.dart';
import 'package:food_app/core/auxiliary_widgets/app_loading.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller.dart';
import 'package:food_app/core/models/user_model/user_model.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:food_app/core/repositories/user_repository/user_repository_interface.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:get/get.dart';

import 'mixins/login_animation_mixin.dart';

class LoginPageController extends GetxController with LoginAnimationsMixin {
  final AppPages _appPages;
  final IAuthController _authController;
  final IUserRepository _userRepository;
  final IRestaurantRepository _restaurantRepository;

  LoginPageController({
    required AppPages appPages,
    required IAuthController authController,
    required IUserRepository userRepository,
    required IRestaurantRepository restaurantRepository,
  })  : _appPages = appPages,
        _authController = authController,
        _userRepository = userRepository,
        _restaurantRepository = restaurantRepository {
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

    loginController.text = '';
    passwordController.text = '';
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
      loginErrorLabel.value = AppUtil.emailValidator(email);
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

      if (result.success!) {
        var user = await _userRepository.getUser(email: loginController.text);

        var restaurant = (await _restaurantRepository.getRestaurantByUser(user!.uid))!;
        Get.back();

        if (restaurant.uid != '') {
          Get.offAllNamed(_appPages.restaurants, arguments: {'user': user});
        } else {
          Get.offAllNamed(_appPages.restaurantAdd, arguments: {'user': user});
        }
      } else {
        Get.back();
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
    var user = UserModel.init();
    user.email = loginController.text;
    user.password = passwordController.text;

    _authController.signUp(user: user);
  }

  goToSignUpPage() {
    Get.toNamed(_appPages.signUp);
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
