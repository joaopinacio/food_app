import 'package:food_app/layout/components/small/app_animated_splash_background/app_animated_splash_background_component.dart';

class AppAnimatedSplashBackgroundStyles {
  AppAnimatedSplashBackgroundStyles._();

  /// ## AppAnimatedSplashBackgroundStyles  standard
  ///
  /// __[size]__ Tamanho da background a ser animtado
  ///
  /// _[duration]__ Duracao da animacao
  ///
  static AppAnimatedSplashBackgroundComponent standard({
    required double size,
    required int duration,
  }) =>
      AppAnimatedSplashBackgroundComponent(
        size: size,
        duration: duration,
      );
}
