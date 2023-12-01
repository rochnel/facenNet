import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/user.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'dart:async';
class UserServices extends GetxService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String collection = "controleur";

Future<CurrentUser?> getDataUserById({required String documentId}) async {
  try {
    var doc = await _db.collection(collection).doc(documentId).get();

    if (doc.exists) {
      CurrentUser user = CurrentUser.fromDocumentSnapshot(doc);
      print("User found");
      return user;
    } else {
      print('User not found');
      return null; // Retourner null ou une valeur par défaut lorsque le document n'est pas trouvé
    }
  } catch (e) {
    print('Error fetching user: $e');
    return null;
  }
}
}

