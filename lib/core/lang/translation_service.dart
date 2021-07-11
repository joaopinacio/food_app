import 'package:food_app/core/lang/pt.dart';
import 'package:food_app/core/lang/en.dart';
import 'package:food_app/core/lang/es.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale!;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': pt,
        'en_US': en,
        'es_ES': es,
      };
}
