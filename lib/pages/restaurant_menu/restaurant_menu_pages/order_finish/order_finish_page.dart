import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

import 'order_finish_page_controller.dart';

class OrderFinishPage extends GetView<OrderFinishPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppThemes.colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppThemes.colors.white,
                radius: 55.0,
                child: FlareActor(
                  'assets/animations/flare/succes_without_loop.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  animation: 'Untitled',
                ),
              ),
              SizedBox(height: 20.h),
              AppTextStyles.bold_24(text: 'Pedido Finalizado!'),
              SizedBox(height: 50.h),
              AppTextButtonStyles.rounded(
                label: 'new_order'.tr,
                hasBounce: true,
                onTap: controller.backToRestaurantsPage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
