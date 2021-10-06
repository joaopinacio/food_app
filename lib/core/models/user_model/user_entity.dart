abstract class UserEntity {
  String uid;
  String email;
  String password;
  String firstName;
  String lastName;
  String userType;

  UserEntity({
    required this.uid,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.userType,
  });
}
