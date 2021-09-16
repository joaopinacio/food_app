import 'package:flutter/material.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:get/get.dart';

import 'restaurant_menu_page_controller.dart';

class RestaurantMenuPage extends GetView<RestaurantMenuPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBarStyles.searchWithReturn(
          onTapReturn: Get.back,
          onTapSearch: () {},
          iconsColor: Colors.black,
        ),
        body: Center(
          child: Text('Restaurant Menu Page'),
        ),
      ),
    );
  }
}
