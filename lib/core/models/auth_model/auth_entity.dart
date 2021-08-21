import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEntity {
  User? user;
  String? errorType;
  bool? success;

  AuthEntity({
    this.user,
    this.errorType,
    this.success,
  });
}
