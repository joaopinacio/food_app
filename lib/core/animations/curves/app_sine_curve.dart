import 'dart:math';

import 'package:flutter/material.dart';

class AppSineCurve extends Curve {
  final double count;

  AppSineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}
