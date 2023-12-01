import '../entities/user.dart';

abstract class AuthenticationRepository {
  // Future<CurrentUser> signUp(
  //     String username, String email, String pswd, String phone);
  Future<CurrentUser?> signIn(String email, String pswd);
}
