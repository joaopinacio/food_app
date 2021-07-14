import 'package:flutter/material.dart';
import 'package:food_app/layout/components/small/app_input_text/app_input_text_component.dart';

class AppInputTextStyles {
  AppInputTextStyles._();

  /// ## AppInputTextStyles
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
  ///   ///
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

  static AppInputTextComponent standard({
    required Key customKey,
    required String hintText,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputType? textInputType,
    String? Function(String?)? validator,
    void Function(String)? onFieldSubmitted,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    GestureTapCallback? onTap,
    TextInputAction? textInputAction,
    int? maxLines,
    int? minLines,
    bool? enabled,
    bool? obscureText,
    bool? textCapitalization,
    bool? inputQty,
    InputBorder? border,
    Widget? suffixIcon,
    bool? hasError,
    bool? floatingLabel,
    Color? focusedBorderColor,
    Color? unfocusedBorderColor,
  }) =>
      AppInputTextComponent(
        customKey: customKey,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        textInputType: textInputType,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: minLines,
        enabled: enabled,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        inputQty: inputQty,
        border: border,
        suffixIcon: suffixIcon,
        hasError: hasError,
        floatingLabel: floatingLabel,
        focusedBorderColor: focusedBorderColor,
        unfocusedBorderColor: unfocusedBorderColor,
      );
}
