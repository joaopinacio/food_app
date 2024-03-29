import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppTextButtonComponent extends StatelessWidget {
  /// ## AppTextButtonComponent
  ///
  /// __[onPressed]__ Ação do clique
  ///
  /// __[height]__ Altura da componente
  ///
  /// __[width]__ Largura da componente
  ///
  /// __[label]__ Texto exibido no botão
  ///
  /// __[isStretched]__ Se o botão vai ocupar a largura disponível. Default é false
  ///
  /// __[isOutlined]__ Se o botão é OutLined. Default é false
  ///
  /// __[backgroundColor]__ Cor do background
  ///
  /// __[foregroundColor]__ Cor do foreground
  ///
  /// __[padding]__ Padding do texto
  ///
  /// __[textStyle]__ Estilo do label
  ///
  /// __[labelAlign]__ Alinhamento da label
  ///
  /// __[labelOverflow]__ Tipo de overflow da label
  ///
  /// __[margin]__ Margin do componente
  ///
  /// __[showIconNext]__ Se irá ter um icone de seta para direita no canto direito. Default é false
  ///
  final TextStyle textStyle;
  final String label;
  final bool isStretched;
  final bool isOutlined;
  final Function? onPressed;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final bool showIconNext;
  final IconData? iconNext;
  final EdgeInsets? margin;
  final TextAlign? labelAlign;
  final TextOverflow? labelOverflow;
  final BorderRadius? borderRadius;
  final bool hasBounce;

  const AppTextButtonComponent({
    required this.label,
    required this.textStyle,
    this.isStretched = false,
    this.isOutlined = false,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.backgroundColor,
    this.showIconNext = false,
    this.iconNext,
    this.margin,
    this.labelAlign,
    this.labelOverflow,
    this.borderRadius,
    this.hasBounce = false,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: (hasBounce ? 0.5 : 0),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        height: height.h,
        width: isStretched ? double.infinity : width?.w,
        child: isOutlined
            ? OutlinedButton(
                onPressed: null,
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: Text(
                    label,
                    overflow: labelOverflow ?? TextOverflow.ellipsis,
                  ),
                ),
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  textStyle: MaterialStateProperty.all(textStyle),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(foregroundColor ?? AppThemes.colors.generalBlue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: backgroundColor ?? AppThemes.colors.generalBlue,
                      width: 1,
                    ),
                  ),
                ),
              )
            : TextButton(
                onPressed: null,
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: showIconNext ? 25.w : 0),
                          child: Text(
                            label,
                            overflow: labelOverflow ?? TextOverflow.ellipsis,
                            textAlign: labelAlign ?? TextAlign.center,
                          ),
                        ),
                      ),
                      if (showIconNext)
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            iconNext ?? Icons.arrow_right_rounded,
                            color: AppThemes.colors.white,
                          ),
                        )
                    ],
                  ),
                ),
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  textStyle: MaterialStateProperty.all(textStyle),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(backgroundColor ?? AppThemes.colors.generalBlue),
                  foregroundColor: MaterialStateProperty.all(foregroundColor ?? AppThemes.colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: borderRadius ?? BorderRadius.zero,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
