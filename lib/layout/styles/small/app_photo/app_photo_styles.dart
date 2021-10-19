import 'package:food_app/layout/components/small/app_photo/app_photo_component.dart';

class AppPhotoStyles {
  AppPhotoStyles._();

  /// ## AppPhotoStyles  standard
  ///
  /// __[filePath]__ Url para imagem
  ///
  /// __[size]__ Tamanho do componente
  ///
  static AppPhotoComponent standard({
    required String filePath,
    double? size,
  }) =>
      AppPhotoComponent(
        filePath: filePath,
        size: size,
      );
}
