import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/user_model/user_model.dart';

import 'user_repository_interface.dart';

class UserRepositoryImpl implements IUserRepository {
  final FirebaseFirestore firestore;
  CollectionReference<Map<String, dynamic>> get usersCollection => firestore.collection('users');

  UserRepositoryImpl({required this.firestore});

  @override
  Stream<List<UserModel>>? getUsers() {
    try {
      return usersCollection.snapshots().map((snapshots) {
        return snapshots.docs.map((doc) {
          return UserModel.fromJson(doc.data());
        }).toList();
      });
    } catch (e) {
      print('🟥 UserRepositoryImpl.getUsers -> $e');
      return null;
    }
  }

  @override
  Future<bool>? saveUser({
    required UserModel data,
  }) async {
    try {
      await usersCollection.doc(data.uid).set(data.toJson(), SetOptions(merge: true)).timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 UserRepositoryImpl.saveUser -> $e');
      return false;
    }
  }

  @override
  Future<bool>? deleteUser({
    required UserModel data,
  }) async {
    try {
      await usersCollection.doc(data.uid).delete().timeout(
        Duration(milliseconds: 600),
        onTimeout: () {
          return true;
        },
      );
      return true;
    } catch (e) {
      print('🟥 UserRepositoryImpl.deleteUser -> $e');
      return false;
    }
  }
}
