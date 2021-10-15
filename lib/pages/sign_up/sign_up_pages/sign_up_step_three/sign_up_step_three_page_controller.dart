import 'package:food_app/core/auxiliary_widgets/app_loading.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/sign_up/sign_up_page_controller.dart';
import 'package:get/get.dart';

import 'mixins/sign_up_step_three_animation_mixin.dart';

class SignUpStepThreePageController extends GetxController with SignUpStepThreeAnimationMixin {
  final SignUpPageController _signUpPageController;
  final IAuthController _authController;

  SignUpStepThreePageController({
    required SignUpPageController signUpPageController,
    required IAuthController authController,
  })  : _signUpPageController = signUpPageController,
        _authController = authController;

  var passwordKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordFocusNode = FocusNode();
  var confirmPasswordKey = GlobalKey<FormState>();
  var confirmPasswordController = TextEditingController();
  var confirmPasswordFocusNode = FocusNode();

  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  SignUpPageController get getSignUpPageController => _signUpPageController;
  bool get getObscurePassword => obscurePassword.value;
  bool get getObscureConfirmPassword => obscureConfirmPassword.value;

  String? validatorPassword(String? value) {
    var text = value ?? '';

    if (text == '') {
      passwordFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  String? validatorConfirmPassword(String? value) {
    var text = value ?? '';

    if (text == '') {
      confirmPasswordFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else if (text != passwordController.text) {
      return 'passwords_do_not_match'.tr;
    } else {
      return null;
    }
  }

  toogleObscurePassword() {
    obscurePassword.value = !getObscurePassword;
  }

  toogleObscureConfirmPassword() {
    obscureConfirmPassword.value = !getObscureConfirmPassword;
  }

  toFinish() async {
    try {
      if (passwordKey.currentState!.validate()) {
        if (confirmPasswordKey.currentState!.validate()) {
          _signUpPageController.user.password = passwordController.text;
          print(_signUpPageController.user.toJson());
          AppLoading.loading();
          await _authController.signUp(user: _signUpPageController.user);
          await _authController.signIn(
            email: _signUpPageController.user.email,
            password: passwordController.text,
          );
          Get.back();

          if (_signUpPageController.user.userType == 'customer') {
            Get.offAllNamed(_signUpPageController.getAppPages.home);
          } else {
            // TODO: Ir para cadastro de Restaurante
            Get.offAllNamed(_signUpPageController.getAppPages.restaurantAdd, arguments: {'fromSignUp': true});
          }
        }
      }
    } catch (e) {
      print('🟥 SignUpStepThreePageController.toFinish -> $e');
      return false;
    }
  }

  goBack() {
    _signUpPageController.goTo.value = 1;
    textAnimController.reverse();
    passwordAnimController.reverse();
    confirmPasswordAnimController.reverse();
    Future.delayed(Duration(milliseconds: 800), () {
      Get.back();
    });
  }

  @override
  void onClose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }
}
