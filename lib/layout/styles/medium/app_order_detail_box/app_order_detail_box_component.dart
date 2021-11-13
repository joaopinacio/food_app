import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/medium/app_order_detail_box/app_order_detail_box_component.dart';

class AppOrderDetailBoxStyles {
  AppOrderDetailBoxStyles._();

  static AppOrderDetailBoxComponent standard({
    required Behaviour behaviour,
    required String total,
    required Function() onTapEmpty,
    required Function() onTapConclude,
    required bool isActive,
  }) =>
      AppOrderDetailBoxComponent(
        behaviour: behaviour,
        total: total,
        onTapEmpty: onTapEmpty,
        onTapConclude: onTapConclude,
        isActive: isActive,
      );
}
