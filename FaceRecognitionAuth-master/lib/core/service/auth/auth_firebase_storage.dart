import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/core/service/auth/user_firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../domain/entities/user.dart';
import '../../../presentation/shared/widgets/widget_error.dart';
import '../../config/emun.dart';

class AuthFirebaseService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userServices = Get.put(UserServices());
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static String? userId, userEmail;
  Map<String, bool> idusers = {};
  Map<String, bool> idusersFavorite = {};
  Map<String, bool> idAnnonces = {};
  Map<String, bool> bookmarks = {};



  //SIGN out METHOD
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<CurrentUser?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("identifiant " + result.user!.uid);
      CurrentUser? user =
          await userServices.getDataUserById(documentId: result.user!.uid!);
      print(user!.email!);
      print(user.name!);
      if (user.email != null) {
           
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      String message = getMessageFromErrorCode(e.code);
      showErrorMessage(Get.context!,
          error: StoreError(type: "Login error", errorMessage: message));
    } on PlatformException catch (err) {
      if (err.code == 'sign_in_canceled') {
        print(err.toString());
      } else {
        throw err;
      }
    }
  }


}
