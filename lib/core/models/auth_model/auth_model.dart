import 'package:firebase_auth/firebase_auth.dart';

import 'auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    User? user,
    String? errorType,
    bool? success,
  }) : super(
          user: user,
          errorType: errorType,
          success: success,
        );

  static AuthModel init() {
    return AuthModel(
      user: null,
      errorType: '',
      success: false,
    );
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      user: json['user'] ?? null,
      errorType: json['errorType'] ?? '',
      success: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'errorType': errorType,
      'success': success,
    };
  }
}
