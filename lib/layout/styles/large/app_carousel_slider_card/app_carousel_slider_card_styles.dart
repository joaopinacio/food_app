import 'package:flutter/material.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/components/large/app_carousel_slider_card/app_carousel_slider_card_component.dart';

class AppCarouselSliderCardStyles {
  AppCarouselSliderCardStyles._();

  /// ## AppCarouselSliderCardStyles.standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[logoImage]__ Imagem da logo a ser mostrada
  ///
  /// __[primaryImage]__ Imagem principal do card
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[description]__ Descrição do card
  ///
  /// __[type]__ Tipo do Restaurante
  ///
  /// __[rate]__ Avaliação do card
  ///
  /// __[mainColor]__ Cor principal de fundo
  ///
  /// __[onTap]__ Clique do card
  ///
  static AppCarouselSliderCardComponent standard({
    required Behaviour behaviour,
    required String logoImage,
    required String primaryImage,
    required String title,
    required String description,
    required String type,
    required String rate,
    required Color mainColor,
    required Function() onTap,
  }) =>
      AppCarouselSliderCardComponent(
        behaviour: behaviour,
        logoImage: logoImage,
        primaryImage: primaryImage,
        title: title,
        description: description,
        type: type,
        rate: rate,
        mainColor: mainColor,
        onTap: onTap,
      );
}
