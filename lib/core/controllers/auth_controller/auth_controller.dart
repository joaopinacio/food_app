abstract class IAuthController {
  Future<bool> signIn({required String email, required String password});
  Future<bool> signOut();
  Future<bool> signUp({required String email, required String password});
}
