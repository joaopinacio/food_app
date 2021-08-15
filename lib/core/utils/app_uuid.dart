import 'package:uuid/uuid.dart';

class AppUuid {
  static generateUuid() {
    String uid = Uuid().v4().toUpperCase();
    return uid;
  }
}
