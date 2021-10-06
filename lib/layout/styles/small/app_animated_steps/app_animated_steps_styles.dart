import 'package:food_app/layout/components/small/app_animated_steps/app_animated_steps_component.dart';

class AppAnimatedStepsStyles {
  AppAnimatedStepsStyles._();

  /// ## AppBadgeStyles  standard
  ///
  /// __[size]__ Tamanho do componente
  ///
  /// __[duration]__ Duração da animacao
  ///
  /// __[goTo]__ Movimentação do componente
  ///
  static AppAnimatedStepsComponent standard({
    required double size,
    required double groupWidth,
    required int duration,
    double? goTo,
  }) =>
      AppAnimatedStepsComponent(
        size: size,
        groupWidth: groupWidth,
        duration: duration,
        goTo: goTo,
      );
}
