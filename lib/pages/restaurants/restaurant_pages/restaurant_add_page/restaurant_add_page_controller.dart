import 'package:food_app/core/auxiliary_widgets/app_alert_status.dart';
import 'package:food_app/core/auxiliary_widgets/app_color_picker.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
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

  var mainColor = AppThemes.colors.generalBlue.obs;
  var foregroundColor = AppThemes.colors.white.obs;
  var choosedColor = false.obs;

  ImageModel get getLogoImage => logoImage.value;
  ImageModel get getPrimaryImage => primaryImage.value;

  Color get getForegroundColor => foregroundColor.value;
  Color get getMainColor => mainColor.value;
  bool get getChoosedColor => choosedColor.value;

  chooseColor() async {
    var result = await AppColorPicker.showPicker(color: getMainColor);
    if (result != null) {
      choosedColor.value = true;
      mainColor.value = result;
      checkLuminanceColor(result);
    }
  }

  save() {
    if (getChoosedColor) {
      AppAlertStatus.showSuccess();
    }
  }

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

  checkLuminanceColor(Color color) {
    var luminance = AppUtil.checkLuminanceColor(color);

    if (luminance < 0.5) {
      foregroundColor.value = AppThemes.colors.white;
    } else {
      foregroundColor.value = AppThemes.colors.black;
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
