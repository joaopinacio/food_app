import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_app/layout/app_layout_imports.dart';
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
      )..show();
}
