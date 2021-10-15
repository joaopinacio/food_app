import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

class RestaurantAddController extends GetxController {
  RestaurantAddController();

  var fromSignUp = Get.arguments['fromSignUp'];
  var nameKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var restaurantTypeKey = GlobalKey<FormState>();
  var restaurantTypeController = TextEditingController();
  var restaurantTypeFocusNode = FocusNode();

  @override
  void onClose() {
    nameController.dispose();
    nameFocusNode.dispose();
    restaurantTypeController.dispose();
    restaurantTypeFocusNode.dispose();
    super.onClose();
  }
}
