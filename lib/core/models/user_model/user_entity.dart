abstract class UserEntity {
  String uid;
  String email;
  String password;
  String userType;

  UserEntity({
    required this.uid,
    required this.email,
    required this.password,
    required this.userType,
  });
}
