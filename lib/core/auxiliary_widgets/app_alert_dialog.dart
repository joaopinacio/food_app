import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

class AppAlertDialog {
  AppAlertDialog._();

  static showDialogDefault({required Widget widget, bool autoHide = false}) async {
    showDialog(
      context: Get.context!,
      barrierColor: AppThemes.colors.black_40,
      builder: (BuildContext context) {
        return widget;
      },
    );
    if (autoHide)
      await Future.delayed(Duration(seconds: 2), () {
        Get.back();
      });
  }

  static showDialogStandard({required DialogType type, required String title, String? description}) => AwesomeDialog(
        context: Get.context!,
        dialogType: type,
        animType: AnimType.BOTTOMSLIDE,
        title: title,
        desc: description,
        btnOkOnPress: () {},
        headerAnimationLoop: false,
      )..show();

  static showDialogHelp({required String title, bool autoHide = false}) async {
    showDialog(
      context: Get.context!,
      barrierColor: AppThemes.colors.black_40,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppThemes.colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 250.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            children: [
              AppTextStyles.bold_24(text: 'Ajuda'),
              Spacer(),
              AppTextStyles.regular_16(text: 'ashasiudhsaidhadisu'),
              Spacer(),
            ],
          ),
        );
      },
    );
    if (autoHide)
      await Future.delayed(Duration(seconds: 2), () {
        Get.back();
      });
  }
}
