import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  /// ## AppBarComponent
  ///
  /// __[title]__ Titulo a ser mostrado
  ///
  /// __[backgroundColor]__ Cor de fundo
  ///
  /// __[leading]__ Widget ao lado esquerdo
  ///
  /// __[actions]__ Lista de Widgets ao lado direito
  ///
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const AppBarComponent({
    Key? key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: title,
      backgroundColor: backgroundColor ?? Colors.transparent,
      leading: leading,
      actions: actions,
      leadingWidth: 24.w,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
