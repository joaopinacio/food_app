import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtil {
  static String? emailValidator(String email) {
    final RegExp regex = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");

    if (email.isEmpty) {
      return 'this_field_must_be_informed'.tr;
    } else if (!regex.hasMatch(email)) {
      return 'wrong_email_format'.tr;
    }
    return null;
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
}
