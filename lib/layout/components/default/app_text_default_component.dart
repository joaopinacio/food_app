import 'package:flutter/material.dart';

class AppTextDefaultComponent extends StatelessWidget {
  /// ## AppTextDefaultComponent
  ///
  /// __[text]__ Texto a ser Inserido
  ///
  /// __[color]__ Cor do texto

  final String text;
  final Color? color;

  const AppTextDefaultComponent({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color ?? Colors.black),
    );
  }
}
