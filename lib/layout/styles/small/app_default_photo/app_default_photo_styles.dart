import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/small/app_default_photo/app_default_photo_component.dart';

class AppDefaultPhotoStyles {
  AppDefaultPhotoStyles._();

  /// ## AppDefaultPhotoStyles  standard
  ///
  /// __[size]__ Tamanho do componente
  ///
  static AppDefaultPhotoComponent standard({
    double? size,
    Color? color,
  }) =>
      AppDefaultPhotoComponent(
        size: size,
        color: color,
      );
}
