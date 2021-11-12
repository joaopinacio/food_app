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

  static String formatMoney(num value) {
    try {
      final formatter = new NumberFormat.currency(
        locale: 'pt-BR',
        symbol: 'R\$',
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
}
