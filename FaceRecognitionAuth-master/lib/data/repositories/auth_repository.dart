import 'package:get/get.dart';

import '../../core/service/auth/auth_firebase_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  
final store = Get.put(AuthFirebaseService());

  // @override
  // Future<CurrentUser> signUp(
  //     String username, String email, String pswd, String phone) async {
  //   //Fake sign up action
  //   await Future.delayed(Duration(seconds: 1));
  //   return CurrentUser(
  //       username: username, email: email, pswd: pswd, phone: phone);
  // }

   @override
  Future<CurrentUser?> signIn(String email, String pswd) async {
   return await store.signIn(email: email,password: pswd);
  }

}
