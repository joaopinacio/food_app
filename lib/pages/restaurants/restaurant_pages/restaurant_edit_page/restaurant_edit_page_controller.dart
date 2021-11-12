import 'package:food_app/core/auxiliary_widgets/app_alert_status.dart';
import 'package:food_app/core/auxiliary_widgets/app_color_picker.dart';
import 'package:food_app/core/auxiliary_widgets/app_loading.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/models/user_model/user_model.dart';
import 'package:food_app/core/repositories/restaurant_repository/restaurant_repository_interface.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/core/utils/app_uuid.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/restaurants/restaurants_page_controller.dart';
import 'package:get/get.dart';

class RestaurantEditController extends GetxController {
  final AppPages _appPages;
  final IRestaurantRepository _restaurantRepository;
  final RestaurantsPageController _restaurantsPageController;

  RestaurantEditController({
    required AppPages appPages,
    required IRestaurantRepository restaurantRepository,
    required RestaurantsPageController restaurantsPageController,
  })  : _appPages = appPages,
        _restaurantRepository = restaurantRepository,
        _restaurantsPageController = restaurantsPageController {
    init();
  }

  var nameKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var restaurantTypeKey = GlobalKey<FormState>();
  var restaurantTypeController = TextEditingController();
  var restaurantTypeFocusNode = FocusNode();

  var logoImage = ImageModel.init().obs;
  var primaryImage = ImageModel.init().obs;

  var mainColor = AppThemes.colors.generalBlue.obs;
  var foregroundColor = AppThemes.colors.white.obs;
  var choosedColor = false.obs;
  var requiredColorVisible = false.obs;
  var errorRequiredLogo = false.obs;
  var errorRequiredPrimaryImage = false.obs;

  late RestaurantModel restaurant;

  ImageModel get getLogoImage => logoImage.value;
  ImageModel get getPrimaryImage => primaryImage.value;

  Color get getForegroundColor => foregroundColor.value;
  Color get getMainColor => mainColor.value;
  bool get getChoosedColor => choosedColor.value;
  bool get getRequiredColorVisible => requiredColorVisible.value;
  bool get getErrorRequiredLogo => errorRequiredLogo.value;
  bool get getErrorRequiredPrimaryImage => errorRequiredPrimaryImage.value;

  UserModel get getUserLogged => _restaurantsPageController.user;

  init() async {
    try {
      restaurant = (await _restaurantRepository.getRestaurantByUser(getUserLogged.uid))!;

      nameController.text = restaurant.name;
      restaurantTypeController.text = restaurant.restaurantType;
      logoImage.value = restaurant.logo;
      logoImage.value.hashMd5 = '';
      logoImage.value.filePath = '';
      primaryImage.value = restaurant.primaryImage;
      primaryImage.value.hashMd5 = '';
      primaryImage.value.filePath = '';

      mainColor.value = AppUtil.stringColorToColor(restaurant.primaryColor);
      choosedColor.value = true;
    } catch (e) {
      print('🟥 RestaurantEditController.init -> $e');
    }
  }

  chooseColor() async {
    var result = await AppColorPicker.showPicker(color: getMainColor);
    if (result != null) {
      requiredColorVisible.value = false;
      choosedColor.value = true;
      mainColor.value = result;
      checkLuminanceColor(result);
    }
  }

  save() async {
    try {
      if (getChoosedColor) {
        if (validImages() && nameKey.currentState!.validate() && restaurantTypeKey.currentState!.validate()) {
          restaurant.logo.hashMd5 = getLogoImage.hashMd5;
          restaurant.primaryImage.hashMd5 = getPrimaryImage.hashMd5;
          restaurant.name = nameController.text;
          restaurant.restaurantType = restaurantTypeController.text;
          restaurant.primaryColor = getMainColor.toString();
          restaurant.user = getUserLogged;

          AppLoading.loading();

          var result = await _restaurantRepository.saveRestaurant(
            data: restaurant,
            primaryImageModel: getPrimaryImage,
            logoImageModel: getLogoImage,
          );

          Get.back();

          if (result) {
            await AppAlertStatus.showSuccess();
            print('🟦 RestaurantEditController.save -> ${restaurant.name}');
            Get.back();
          } else {
            AppAlertStatus.showError();
          }
        }
      } else {
        requiredColorVisible.value = true;
      }
    } catch (e) {
      print('🟥 RestaurantEditController.save -> $e');
      AppAlertStatus.showError();
    }
  }

  goToCameraPage(bool isLogo) async {
    var result;
    if (isLogo) {
      result = await Get.toNamed(_appPages.camera, arguments: {'data': logoImage.value});

      logoImage.value = result;

      if (getLogoImage.filePath != '') errorRequiredLogo.value = false;
    } else {
      result = await Get.toNamed(_appPages.camera, arguments: {'data': primaryImage.value});

      primaryImage.value = result;
      if (getPrimaryImage.filePath != '') errorRequiredPrimaryImage.value = false;
    }
  }

  void goToProductsPage() {
    Get.toNamed(_appPages.products);
  }

  checkLuminanceColor(Color color) {
    var luminance = AppUtil.checkLuminanceColor(color);

    if (luminance < 0.5) {
      foregroundColor.value = AppThemes.colors.white;
    } else {
      foregroundColor.value = AppThemes.colors.black;
    }
  }

  String? validatorName(String? value) {
    var text = value ?? '';

    if (text == '') {
      nameFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  String? validatorRestauranteType(String? value) {
    var text = value ?? '';

    if (text == '') {
      restaurantTypeFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  bool validImages() {
    var valid = false;

    if (getLogoImage.filePath != '' || getLogoImage.url != '') {
      errorRequiredLogo.value = false;
      valid = true;
    } else {
      errorRequiredLogo.value = true;
      valid = false;
    }

    if (getPrimaryImage.filePath != '' || getPrimaryImage.url != '') {
      errorRequiredPrimaryImage.value = false;
      valid = true;
    } else {
      errorRequiredPrimaryImage.value = true;
      valid = false;
    }

    return valid;
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
