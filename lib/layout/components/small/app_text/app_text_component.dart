import 'package:flutter/material.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppTextComponent extends StatelessWidget {
  /// ## AppTextComponent
  ///
  /// __[text]__ Texto a ser exibidoMargin do container do texto
  ///
  /// __[textStyle]__ Estilo do texto a ser exibido
  ///
  /// __[color]__ Cor do texto a ser exibido
  ///
  /// __[margin]__ Margin do container do texto
  ///
  /// __[maxLines]__ Numero maximo de linhas do texto
  ///
  /// __[overflow]__ Tipo de soprepor texto dependendo do espaço livre
  ///
  /// __[textAlign]__ Tipo de Alinhamento do texto a ser exibido
  ///
  /// __[lineThrough]__ Linha passando por cima do texto (cortando)
  ///

  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final EdgeInsets? margin;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? lineThrough;

  const AppTextComponent({
    Key? key,
    required this.text,
    this.margin,
    this.maxLines,
    this.textStyle,
    this.color,
    this.overflow,
    this.textAlign,
    this.lineThrough = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Text(
        text,
        style: textStyle?.copyWith(
              color: color ?? AppThemes.colors.black,
              decoration: lineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
            ) ??
            TextStyle(
              color: color ?? AppThemes.colors.black,
              decoration: lineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
            ),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
