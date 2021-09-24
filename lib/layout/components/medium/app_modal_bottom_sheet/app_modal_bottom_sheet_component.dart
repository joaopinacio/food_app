import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:get/get.dart';

showModalBottomSheetComponent({required Widget child, bool isDismissible = true}) {
  return showModalBottomSheet(
    barrierColor: AppThemes.colors.black_40,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14.r),
        topRight: Radius.circular(14.r),
      ),
    ),
    backgroundColor: AppThemes.colors.white,
    context: Get.key.currentContext!,
    builder: (context) {
      return Wrap(
        children: [
          SafeArea(
            child: WillPopScope(
              onWillPop: () async => true,
              child: child,
            ),
          ),
        ],
      );
    },
  );
}
