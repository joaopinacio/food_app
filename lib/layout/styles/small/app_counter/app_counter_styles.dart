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
    double? widthQty,
    double? heightQty,
    double? iconSize,
    double? alignIconLeft,
    double? alignIconRight,
    double? fontSizeQty,
  }) =>
      AppCounterComponent(
        behaviour: behaviour,
        max: max,
        min: min,
        initialValue: initialValue,
        onChange: onChange,
        width: width,
        height: height,
        widthQty: widthQty,
        heightQty: heightQty,
        iconSize: iconSize,
        alignIconLeft: alignIconLeft,
        alignIconRight: alignIconRight,
        fontSizeQty: fontSizeQty,
        color: color,
        colorIcons: colorIcons,
      );

  /// ## AppCounterStyles.product
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
    int? min,
  }) =>
      AppCounterComponent(
        behaviour: behaviour,
        width: 100,
        height: 36,
        max: 99,
        min: min,
        initialValue: initialValue ?? 0,
        onChange: onChange,
        color: color,
        colorIcons: colorIcons,
      );

  /// ## AppCounterStyles.mini
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[onChange]__ Callback do contador
  ///
  /// __[color]__ Cor do componente
  ///
  static AppCounterComponent mini({
    required Behaviour behaviour,
    required IntCallback onChange,
    required Color color,
    required Color colorIcons,
    int? initialValue,
    int? min,
  }) =>
      AppCounterComponent(
        behaviour: behaviour,
        width: 75,
        height: 30,
        widthQty: 20,
        heightQty: 20,
        iconSize: 15,
        alignIconLeft: -1.3,
        alignIconRight: 1.3,
        fontSizeQty: 14,
        max: 99,
        min: min,
        initialValue: initialValue ?? 0,
        onChange: onChange,
        color: color,
        colorIcons: colorIcons,
      );
}
