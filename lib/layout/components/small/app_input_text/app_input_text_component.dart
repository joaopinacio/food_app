import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppInputTextComponent extends StatefulWidget {
  /// ## AppInputTextComponent
  ///
  /// __[customKey]__ Key para o Campo ser unico
  ///
  /// __[hintText]__ Texto para placeholder (?)
  ///
  /// __[controller]__ Controller do Campo
  ///
  /// __[focusNode]__ Variavel para controlar o Foco do Campo
  ///
  /// __[textInputType]__ Tipo de teclado que é exibido
  ///
  /// __[validator]__ Função de Validar campo
  ///
  /// __[onFieldSubmitted]__ Quando o campo é finalizado
  ///
  /// __[onChanged]__ Quando o campo é alterado (escreve algo)
  ///
  /// __[onEditingComplete]__ Concluindo a digitação
  ///
  /// __[onTap]__ Ao clicar no campo
  ///
  /// __[textInputAction]__ Botão de "Go"
  ///
  /// __[maxLines]__ Numero maximo de linhas do campo
  ///
  /// __[minLines]__ Numero minimo de linhas do campo
  ///
  /// __[enabled]__ Se está habilitado
  ///
  /// __[obscureText]__ Esconder texto com "*"
  ///
  /// __[textCapitalization]__ Tipo de Capitalização do campo (ex: se ao colocar espaço a proxima letra é maiuscula)
  ///
  /// __[inputQty]__ Se o campo é numérico (de quantidade)
  ///
  /// __[border]__ Borda do campo
  ///
  /// __[suffixIcon]__ Icone que irá aparecer ao final do Campo
  ///
  /// __[hasError]__ Se o campo estiver com error
  ///
  /// __[floatingLabel]__ Se o campo irá ter o hintText no topo do campo
  ///
  /// __[focusedBorderColor]__ Cor da borda quando o campo estiver focado
  ///
  /// __[unfocusedBorderColor]__ Cor da borda quando o campo estiver desfocado
  ///

  final Key customKey;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final GestureTapCallback? onTap;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool? obscureText;
  final bool? textCapitalization;
  final bool? inputQty;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool? hasError;
  final bool? floatingLabel;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;

  const AppInputTextComponent({
    Key? key,
    required this.customKey,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.obscureText = false,
    this.textCapitalization,
    this.inputQty = false,
    this.border,
    this.suffixIcon,
    this.hasError = false,
    this.floatingLabel = false,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
  }) : super(key: key);

  @override
  _AppInputTextComponentState createState() => _AppInputTextComponentState();
}

class _AppInputTextComponentState extends State<AppInputTextComponent> {
  var hasFocus = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        hasFocus = !hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.customKey,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: AppThemes.colors.grayScale_1,
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: AppThemes.typography.poppinsSemiBold_12.copyWith(
              color: AppThemes.colors.generalRed,
            ),
          ),
        ),
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.textInputType,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines ?? 1,
          enabled: widget.enabled,
          obscureText: widget.obscureText ?? false,
          textCapitalization: widget.textCapitalization == true
              ? TextCapitalization.words
              : TextCapitalization.none,
          textAlign:
              widget.inputQty == true ? TextAlign.center : TextAlign.start,
          showCursor: true,
          style: widget.inputQty == true
              ? AppThemes.typography.poppinsBold_30
              : AppThemes.typography.poppinsRegular_16,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            labelText: widget.floatingLabel ?? false ? widget.hintText : null,
            labelStyle: AppThemes.typography.poppinsSemiBold_12.copyWith(
              color: widget.hasError == true
                  ? AppThemes.colors.generalRed
                  : (hasFocus
                      ? widget.focusedBorderColor ??
                          AppThemes.colors.generalBlue
                      : widget.unfocusedBorderColor ??
                          AppThemes.colors.grayScale_2),
            ),
            hintText: widget.floatingLabel ?? false ? null : widget.hintText,
            hintStyle: widget.inputQty == true
                ? AppThemes.typography.poppinsBold_30
                : AppThemes.typography.poppinsRegular_16
                    .copyWith(color: AppThemes.colors.grayScale_2),
            floatingLabelBehavior: widget.floatingLabel == true
                ? FloatingLabelBehavior.auto
                : FloatingLabelBehavior.never,
            enabledBorder: widget.border != null
                ? widget.border?.copyWith(
                    borderSide: BorderSide(
                      color: widget.unfocusedBorderColor ??
                          AppThemes.colors.grayScale_2,
                    ),
                  )
                : InputBorder.none,
            errorBorder: widget.border != null
                ? widget.border?.copyWith(
                    borderSide: BorderSide(
                      color: AppThemes.colors.generalRed,
                    ),
                  )
                : InputBorder.none,
            disabledBorder: widget.border != null
                ? widget.border?.copyWith(
                    borderSide: BorderSide(
                      color: AppThemes.colors.grayScale_1,
                    ),
                  )
                : InputBorder.none,
            focusedBorder: widget.border != null
                ? widget.border?.copyWith(
                    borderSide: BorderSide(
                      color: widget.focusedBorderColor ??
                          AppThemes.colors.generalBlue,
                    ),
                  )
                : InputBorder.none,
            focusedErrorBorder: widget.border != null
                ? widget.border?.copyWith(
                    borderSide: BorderSide(
                      color: widget.focusedBorderColor ??
                          AppThemes.colors.generalRed,
                    ),
                  )
                : InputBorder.none,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
