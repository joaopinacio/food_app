import 'dart:async';

import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_interface.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/pages/restaurants/restaurant_pages/restaurant_edit_page/restaurant_edit_page_controller.dart';
import 'package:get/get.dart';

class ProductsPageController extends GetxController {
  final RestaurantEditController _restaurantEditController;
  final IProductRepository _productRepository;

  ProductsPageController({
    required RestaurantEditController restaurantEditController,
    required IProductRepository productRepository,
  })  : _restaurantEditController = restaurantEditController,
        _productRepository = productRepository {
    init();
  }

  late StreamSubscription _productsStream;

  var pageBehaviour = Behaviour.loading.obs;
  var productList = <ProductModel>[].obs;

  Behaviour get getPageBehaviour => pageBehaviour.value;

  void init() {
    fetchProducts();
  }

  void fetchProducts() {
    _productsStream = _productRepository
        .getProductsByRestaurant(restaurantUid: _restaurantEditController.restaurant.uid)!
        .listen(_listenProductsStream);
  }

  void _listenProductsStream(List<ProductModel> list) async {
    productList.value = list;

    await Future.delayed(Duration(seconds: 1));
    pageBehaviour.value = Behaviour.regular;
  }

  String formatPrice(num value) {
    return AppUtil.formatMoney(value);
  }

  void goToProductAdd() {}

  @override
  void onClose() {
    super.onClose();
    _productsStream.cancel();
  }
}
