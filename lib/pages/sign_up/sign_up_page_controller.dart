import 'package:food_app/core/models/user_model/user_model.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  final AppPages _appPages;

  SignUpPageController({required AppPages appPages}) : _appPages = appPages;

  var user = UserModel.init();

  AppPages get getAppPages => _appPages;

  goToStepOne() {
    Get.toNamed(_appPages.signUpStepOne);
  }
}
