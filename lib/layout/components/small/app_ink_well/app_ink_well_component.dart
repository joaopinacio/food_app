import 'package:flutter/material.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppInkWellComponent extends StatelessWidget {
  /// ## AppInkWellComponent
  ///
  /// __[child]__ Widget filho
  ///
  /// __[onTap]__ Funcao Tap
  ///

  final Widget child;
  final Function()? onTap;

  const AppInkWellComponent({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
