import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

class RestaurantAddController extends GetxController {
  final AppPages _appPages;

  RestaurantAddController({required AppPages appPages}) : _appPages = appPages;

  var fromSignUp = Get.arguments['fromSignUp'];
  var nameKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var restaurantTypeKey = GlobalKey<FormState>();
  var restaurantTypeController = TextEditingController();
  var restaurantTypeFocusNode = FocusNode();

  var logoImage = ImageModel.init().obs;
  var primaryImage = ImageModel.init().obs;

  ImageModel get getLogoImage => logoImage.value;
  ImageModel get getPrimaryImage => primaryImage.value;

  goToCameraPage(bool isLogo) async {
    var result;
    if (isLogo) {
      result = await Get.toNamed(_appPages.camera, arguments: {'data': logoImage.value});

      logoImage.value = result;
    } else {
      result = await Get.toNamed(_appPages.camera, arguments: {'data': primaryImage.value});

      primaryImage.value = result;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    nameFocusNode.dispose();
    restaurantTypeController.dispose();
    restaurantTypeFocusNode.dispose();
    super.onClose();
  }
}
