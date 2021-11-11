import 'package:flutter/material.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/small/app_network_image/app_network_image_component.dart';

class AppNetworkImageStyles {
  AppNetworkImageStyles._();

  /// ## Network image
  ///
  /// __[behavior]__ Behaviour do component
  ///
  /// __[image]__ "URL" da imagem
  ///
  /// __[height]__ Tamanho da imagem
  ///
  /// __[boxFit]__ Estilo de preenchimento da imagem
  ///
  /// __[borderRadius]__ Raio da borda que fará um crop na imagem
  static AppNetWorkImageComponent standard({
    required Behaviour behaviour,
    required String image,
    double? height,
    double? width,
    BoxFit? boxFit,
    BorderRadius? borderRadius,
  }) =>
      AppNetWorkImageComponent(
        behaviour: behaviour,
        height: height,
        width: width,
        image: image,
        boxFit: boxFit,
        borderRadius: borderRadius,
      );
}
