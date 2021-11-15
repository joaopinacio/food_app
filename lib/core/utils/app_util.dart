import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppUtil {
  static String emailValidator(String email) {
    final RegExp regex = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");

    if (email.isEmpty) {
      return 'this_field_must_be_informed'.tr;
    } else if (!regex.hasMatch(email)) {
      return 'wrong_email_format'.tr;
    }
    return '';
  }

  static String? passwordValidator(String password) {
    if (password.isEmpty) {
      return 'this_field_must_be_informed'.tr;
    }
    return null;
  }

  static double checkLuminanceColor(Color color) {
    return color.computeLuminance();
  }

  static Color stringColorToColor(String colorString) {
    String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    return Color(value);
  }

  static String formatMoney({required num value, String? symbol}) {
    try {
      final formatter = new NumberFormat.currency(
        locale: 'pt-BR',
        symbol: symbol ?? 'R\$',
        decimalDigits: 2,
        name: 'formatMoney',
      );

      return formatter.format(value).toString();
    } catch (e) {
      print('Error formatMoney >>> ${e.toString()}');
      final formatter = new NumberFormat.currency(
        locale: 'pt-BR',
        symbol: 'R\$',
        decimalDigits: 2,
        name: 'formatMoney',
      );
      return formatter.format(value).toString();
    }
  }

  static MoneyMaskedTextController getValueFormatting(
      {double? price, bool? showSymbol = true, String? symbol, bool? symbolRight = false, int? customPrecision = 2}) {
    try {
      var _symbol = symbol ?? 'R\$';

      MoneyMaskedTextController result;
      var precision = 2;
      if (symbolRight == false) {
        result = MoneyMaskedTextController(
          decimalSeparator: ',',
          initialValue: price ?? 0,
          leftSymbol: showSymbol!
              ? _symbol != ''
                  ? '$_symbol '
                  : 'R\$'
              : '',
          thousandSeparator: '.',
          precision: customPrecision ?? precision,
        );
      } else {
        _symbol = symbol ?? '%';
        result = MoneyMaskedTextController(
          decimalSeparator: ',',
          initialValue: price ?? 0,
          rightSymbol: ' $_symbol',
          thousandSeparator: '.',
          precision: precision,
        );
      }
      return result;
    } catch (e) {
      print('🟥 getValueFormatting -> $e');
      return MoneyMaskedTextController(
        decimalSeparator: ',',
        initialValue: 0,
        leftSymbol: 'R\$',
        thousandSeparator: '.',
        precision: 2,
      );
    }
  }

  static String convertRestaurantListGrid(int value) {
    switch (value) {
      case 1:
        return '1 x 1';
      case 2:
        return '2 x 2';
      case 3:
        return '3 x 3';
      default:
        return '';
    }
  }
}
