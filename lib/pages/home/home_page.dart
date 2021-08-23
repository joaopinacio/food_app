import 'package:flutter/material.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_bar/app_bar_styles.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBarStyles.leftAndRightIcon(
          leftIcon: Icons.menu,
          onTapRight: () {},
          rightIcon: Icons.search,
          onTapLeft: () {},
        ),
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
