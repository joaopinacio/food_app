import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  final AppPages _appPages;

  SplashPageController({required AppPages appPages}) : _appPages = appPages {
    init();
  }

  var logoHeight = 10.0.obs;
  var logoOpacity = 0.0.obs;

  double get getLogoHeight => logoHeight.value;
  double get getLogoOpacity => logoOpacity.value;

  init() {
    Future.delayed(Duration(milliseconds: 500), () {
      logoHeight.value = 80;
      logoOpacity.value = 1;
      Future.delayed(Duration(milliseconds: 3500), () {
        Get.toNamed(_appPages.login);
      });
    });
  }
}
