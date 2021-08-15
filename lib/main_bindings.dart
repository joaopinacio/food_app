import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/classes/core_bindings.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller.dart';
import 'package:food_app/core/controllers/auth_controller/auth_controller_impl.dart';
import 'package:food_app/core/repositories/auth_repository/auth_repository.dart';
import 'package:food_app/core/repositories/auth_repository/auth_repository_impl.dart';
import 'package:food_app/core/repositories/user_repository/user_repository_impl.dart';
import 'package:food_app/core/repositories/user_repository/user_repository_interface.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:get/get.dart';

class MainBindings implements CoreBindings {
  @override
  void dependencies() {
    registerRepositories();
    registerControllers();
  }

  @override
  void registerRepositories() {
    Get.put(AppPages.instance, permanent: true);
    Get.put(FirebaseFirestore.instance, permanent: true);
    Get.put(FirebaseAuth.instance, permanent: true);
    Get.lazyPut<IUserRepository>(
      () => UserRepositoryImpl(firestore: Get.find()),
      fenix: true,
    );
    Get.lazyPut<IAuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: Get.find()),
      fenix: true,
    );
  }

  @override
  void registerControllers() {
    Get.lazyPut<IAuthController>(
      () => AuthControllerImpl(
        authRepository: Get.find(),
        userRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
