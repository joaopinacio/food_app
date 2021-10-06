import 'user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String uid,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userType,
  }) : super(
          uid: uid,
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          userType: userType,
        );

  static UserModel init() {
    return UserModel(
      uid: '',
      email: '',
      password: '',
      firstName: '',
      lastName: '',
      userType: '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? null,
      email: json['email'] ?? null,
      password: json['password'] ?? null,
      firstName: json['firstName'] ?? null,
      lastName: json['lastName'] ?? null,
      userType: json['userType'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
    };
  }
}
