import 'package:food_app/layout/components/small/app_badge/app_badge_component.dart';

class AppBadgeStyles {
  AppBadgeStyles._();

  /// ## AppBadgeStyles  standard
  ///
  /// __[size]__ Tamanho da badge
  ///
  /// _[assetPath]__ Caminho do asset
  ///
  static AppBadgeComponent standard({
    required String assetPath,
    required double size,
  }) =>
      AppBadgeComponent(
        assetPath: assetPath,
        size: size,
      );

  /// ## AppBadgeStyles  logo
  ///
  /// __[size]__ Tamanho da badge
  ///
  /// _[assetPath]__ Caminho do asset
  ///
  static AppBadgeComponent logo({
    double? size,
  }) =>
      AppBadgeComponent(
        assetPath: 'assets/svg_images/TestLogo.svg',
        size: size ?? 60,
      );
}
