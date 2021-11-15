import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/models/cart_model/cart_model.dart';
import 'package:food_app/core/models/product_cart_model/product_cart_model.dart';
import 'package:food_app/core/models/product_model/product_model.dart';
import 'package:food_app/core/models/restaurant_model/restaurant_model.dart';
import 'package:food_app/core/repositories/product_repository/product_repository_interface.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/core/utils/app_util.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/pages/restaurant_menu/mixins/restaurant_menu_animations.dart';
import 'package:food_app/pages/restaurants/restaurants_page_controller.dart';
import 'package:get/get.dart';

class RestaurantMenuPageController extends GetxController with RestaurantMenuAnimations, SingleGetTickerProviderMixin {
  final AppPages _appPages;
  final RestaurantsPageController _restaurantsPageController;
  final IProductRepository _productRepository;

  RestaurantMenuPageController({
    required AppPages appPages,
    required RestaurantsPageController restaurantsPageController,
    required IProductRepository productRepository,
  })  : _appPages = appPages,
        _restaurantsPageController = restaurantsPageController,
        _productRepository = productRepository;

  RestaurantsPageController get getRestaurantsPageController => _restaurantsPageController;

  var mainColor = AppThemes.colors.black;
  var productList = <ProductModel>[].obs;
  var cart = CartModel.init().obs;
  var qtySelected = 1;

  late RestaurantModel restaurant;
  late StreamSubscription _productsStream;

  CartModel get getCart => cart.value;

  @override
  void onInit() {
    initAnimation();
    super.onInit();
  }

  initAnimation() {
    restaurant = Get.arguments['restaurant'];
    fetchProducts();
    mainColor = AppUtil.stringColorToColor(restaurant.primaryColor);

    appBarIconsColorController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    appBarIconsColorAnim =
        ColorTween(begin: AppThemes.colors.white, end: AppThemes.colors.black).animate(appBarIconsColorController);

    checkLuminanceColor(mainColor);
  }

  void fetchProducts() {
    _productsStream =
        _productRepository.getProductsByRestaurant(restaurantUid: restaurant.uid)!.listen(_listenProductsStream);
  }

  void _listenProductsStream(List<ProductModel> list) async {
    productList.value = list;
  }

  bool checkUserIsRestaurant() {
    return _restaurantsPageController.user.userType == 'restaurant';
  }

  String? formatMoney(num price, {bool isOldPrice = false}) {
    if (price == 0 && isOldPrice) return null;
    return AppUtil.formatMoney(value: price, symbol: '').trim();
  }

  void btnAddToCart(ProductModel product) {
    addToCart(product);
    Get.back();
  }

  void addToCart(ProductModel product) {
    var hasProduct = cart.value.productsCart.where((element) => element.uid == product.uid).toList();

    var productCart = ProductCartModel(
      uid: product.uid,
      name: product.name,
      price: product.price,
      oldPrice: product.oldPrice,
      image: product.image,
      productType: product.productType,
      restaurantUid: product.restaurantUid,
      qty: qtySelected,
      total: (product.price * qtySelected),
    );

    if (hasProduct.length == 0) {
      cart.value.productsCart.add(productCart);
    } else {
      cart.value.productsCart.forEach((element) {
        if (element.uid == product.uid) {
          element.qty += qtySelected;
          element.total = (product.price * element.qty);
        }
      });
    }

    updateCartTotalAndQty();
    qtySelected = 1;
  }

  void updateCartTotalAndQty() {
    num total = 0;
    int qty = 0;
    cart.value.productsCart.forEach((element) {
      total += element.total;
      qty += element.qty;
    });
    cart.value.total = total;
    cart.value.qty = qty;
    cart.refresh();
  }

  void changeProductQty(int value, int index) {
    var actualProduct = cart.value.productsCart[index];
    actualProduct.qty = value;
    actualProduct.total = (actualProduct.price * actualProduct.qty);
    updateCartTotalAndQty();
  }

  void removeProductCart(int index) {
    cart.value.productsCart.removeAt(index);
    updateCartTotalAndQty();
  }

  void emptyCart() {
    cart.value.productsCart.clear();
    cart.value.qty = 0;
    cart.value.total = 0;
    cart.refresh();
  }

  bool productInCart(String uid) {
    return cart.value.productsCart.where((productCart) => productCart.uid == uid).length > 0;
  }

  void goToCartPage() {
    Get.toNamed(_appPages.cart);
  }

  @override
  void onClose() {
    appBarIconsColorController.dispose();
    _productsStream.cancel();
    super.onClose();
  }
}
