import 'package:get/get.dart';

class SplashPageController extends GetxController {
  SplashPageController() {
    init();
  }

  var logoHeight = 10.0.obs;
  var logoOpacity = 0.0.obs;
  var backgroundWidth = 0.0.obs;
  var backgroundHeight = 0.0.obs;

  double get getLogoHeight => logoHeight.value;
  double get getLogoOpacity => logoOpacity.value;
  double get getBackgroundWidth => backgroundWidth.value;
  double get getBackgroundHeight => backgroundHeight.value;

  init() {
    Future.delayed(Duration(milliseconds: 500), () {
      logoHeight.value = 80;
      logoOpacity.value = 1;
      Future.delayed(Duration(milliseconds: 2000), () {
        backgroundWidth.value = Get.width;
        backgroundHeight.value = Get.height;
      });
    });
  }
}
