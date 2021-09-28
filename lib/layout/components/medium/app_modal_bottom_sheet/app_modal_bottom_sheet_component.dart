import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

showModalBottomSheetComponent({
  required Widget child,
  bool isDismissible = true,
  ShapeBorder? shape,
  double? radiusTopLeft,
  double? radiusTopRight,
}) {
  return showModalBottomSheet(
    barrierColor: AppThemes.colors.black_40,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: true,
    shape: shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusTopLeft?.r ?? 14.r),
            topRight: Radius.circular(radiusTopRight?.r ?? 14.r),
          ),
        ),
    backgroundColor: AppThemes.colors.white,
    context: Get.key.currentContext!,
    builder: (context) {
      return child;
    },
  );
}
