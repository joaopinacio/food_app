import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

class AppColorPicker {
  static Future<dynamic> showPicker({Color? color}) async {
    var selectedColor;
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AppTextStyles.semiBold_14(text: 'pick_a_color'.tr),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color ?? Colors.white,
              onColorChanged: (Color colorChanged) {
                selectedColor = colorChanged;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            AppTextButtonStyles.primary(
              backgroundColor: AppThemes.colors.generalGreen,
              label: 'OK',
              onTap: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
    return selectedColor;
  }
}
