import 'user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String uid,
    required String email,
    required String password,
    required String userType,
  }) : super(
          uid: uid,
          email: email,
          password: password,
          userType: userType,
        );

  static UserModel init() {
    return UserModel(
      uid: '',
      email: '',
      password: '',
      userType: '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? null,
      email: json['email'] ?? null,
      password: json['password'] ?? null,
      userType: json['userType'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }
}
