import 'package:food_app/core/auxiliary_widgets/app_alert_status.dart';
import 'package:food_app/core/auxiliary_widgets/app_loading.dart';
import 'package:food_app/core/models/image_model/image_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_interface.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/restaurants/restaurant_pages/restaurant_edit_page/restaurant_edit_page_controller.dart';
import 'package:get/get.dart';

class ProductEditController extends GetxController {
  final AppPages _appPages;
  final IProductRepository _productRepository;
  final RestaurantEditController _restaurantEditController;

  ProductEditController({
    required AppPages appPages,
    required IProductRepository productRepository,
    required RestaurantEditController restaurantEditController,
  })  : _appPages = appPages,
        _productRepository = productRepository,
        _restaurantEditController = restaurantEditController {
    init();
  }

  var nameKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var descKey = GlobalKey<FormState>();
  var descController = TextEditingController();
  var descFocusNode = FocusNode();
  var priceKey = GlobalKey<FormState>();
  var priceController = AppUtil.getValueFormatting(price: 0);
  var priceFocusNode = FocusNode();
  var oldPriceKey = GlobalKey<FormState>();
  var oldPriceController = AppUtil.getValueFormatting(price: 0);
  var oldPriceFocusNode = FocusNode();

  var productImage = ImageModel.init().obs;

  var errorRequiredImage = false.obs;

  ProductModel product = ProductModel.init();

  ImageModel get getProductImage => productImage.value;

  bool get getErrorRequiredImage => errorRequiredImage.value;

  void init() {
    product = Get.arguments['product'];

    nameController.text = product.name;
    descController.text = product.description;
    priceController = AppUtil.getValueFormatting(price: product.price.toDouble());
    oldPriceController = AppUtil.getValueFormatting(price: product.oldPrice!.toDouble());
    productImage.value = product.image;
    productImage.value.filePath = '';
    productImage.value.hashMd5 = '';
  }

  void save() async {
    try {
      if (validImage() && nameKey.currentState!.validate() && descKey.currentState!.validate()) {
        product.image.hashMd5 = getProductImage.hashMd5;
        product.name = nameController.text;
        product.description = descController.text;
        product.price = priceController.numberValue;
        product.oldPrice = oldPriceController.numberValue;
        product.restaurantUid = _restaurantEditController.restaurant.uid;

        AppLoading.loading();

        var result = await _productRepository.saveProduct(
          data: product,
          imageModel: getProductImage,
        );

        Get.back();

        if (result) {
          await AppAlertStatus.showSuccess();
          print('🟦 ProductAddController.save -> ${product.name}');
          Get.back();
        } else {
          AppAlertStatus.showError();
        }
      }
    } catch (e) {
      print('🟥 ProductAddController.save -> $e');
      AppAlertStatus.showError();
    }
  }

  goToCameraPage(bool isLogo) async {
    var result;
    result = await Get.toNamed(_appPages.camera, arguments: {'data': productImage.value});

    productImage.value = result;

    if (getProductImage.filePath != '') errorRequiredImage.value = false;
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

  String? validatorDescription(String? value) {
    var text = value ?? '';

    if (text == '') {
      descFocusNode.requestFocus();
      return 'this_field_must_be_informed'.tr;
    } else {
      return null;
    }
  }

  bool validImage() {
    var valid = false;

    if (getProductImage.filePath != '' || getProductImage.url != '') {
      errorRequiredImage.value = false;
      valid = true;
    } else {
      errorRequiredImage.value = true;
      valid = false;
    }

    return valid;
  }

  @override
  void onClose() {
    nameController.dispose();
    nameFocusNode.dispose();
    descController.dispose();
    descFocusNode.dispose();
    priceController.dispose();
    priceFocusNode.dispose();
    oldPriceController.dispose();
    oldPriceFocusNode.dispose();
    super.onClose();
  }
}
