import 'package:flutter/material.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/small/app_counter/app_counter_component.dart';

typedef IntCallback(int);

class AppCounterStyles {
  AppCounterStyles._();

  /// ## AppCounterStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[max]__ Maximo
  ///
  /// __[min]__ Minimo
  ///
  /// __[initialValue]__ Valor Inicial
  ///
  /// __[onChange]__ Callback do contador
  ///
  /// __[width]__ Largura do componente
  ///
  /// __[height]__ Altura do componente
  ///
  /// __[color]__ Cor do componente
  ///
  static AppCounterComponent standard({
    required Behaviour behaviour,
    int max = 100,
    int min = 0,
    int initialValue = 0,
    required IntCallback onChange,
    required double width,
    required double height,
    required Color color,
    required Color colorIcons,
  }) =>
      AppCounterComponent(
        behaviour: behaviour,
        max: max,
        min: min,
        initialValue: initialValue,
        onChange: onChange,
        width: width,
        height: height,
        color: color,
        colorIcons: colorIcons,
      );

  /// ## AppCounterStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[onChange]__ Callback do contador
  ///
  /// __[color]__ Cor do componente
  ///
  static AppCounterComponent product({
    required Behaviour behaviour,
    required IntCallback onChange,
    required Color color,
    required Color colorIcons,
    int? initialValue,
  }) =>
      AppCounterComponent(
        behaviour: behaviour,
        width: 100,
        height: 36,
        max: 99,
        min: 0,
        initialValue: initialValue ?? 0,
        onChange: onChange,
        color: color,
        colorIcons: colorIcons,
      );
}
