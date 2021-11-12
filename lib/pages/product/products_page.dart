import 'package:flutter/material.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:get/get.dart';

import 'products_page_controller.dart';

class ProductsPage extends GetView<ProductsPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBarStyles.onlyTitleAndBack(
          title: 'products'.tr,
          onTapBack: Get.back,
        ),
        body: Center(
          child: Text('Products Page'),
        ),
      ),
    );
  }
}
