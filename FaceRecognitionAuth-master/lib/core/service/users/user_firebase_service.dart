import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user.dart';

class UserFirebaseService extends GetxService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String collection = "USERS";
    final currentUser = FirebaseAuth.instance.currentUser;

Future<bool> addToFavoritesPost(String annonceId) async {
  bool status = false;
  FirebaseFirestore.instance
      .collection(collection)
      .doc(currentUser!.uid)
      .collection('favoris')
      .doc(annonceId)
      .set({'annonceId': annonceId}).whenComplete(() {
      status = true;
    }).catchError((onError){
      status = false;
      print(onError);
    });

    return status;
}

Future<bool> removeToFavoritesPost(String annonceId) async {
  bool status = false;
  FirebaseFirestore.instance
      .collection(collection)
      .doc(currentUser!.uid)
      .collection('favoris')
      .doc(annonceId)
      .delete().whenComplete(() {
      status = true;
    }).catchError((onError){
      status = false;
      print(onError);
    });

    return status;
}

Future<bool> getPostIsFavoriteByUser(String annonceId) async {
  if (currentUser != null) {
    final userFavoritesRef = FirebaseFirestore.instance
        .collection(collection)
        .doc(currentUser!.uid)
        .collection('favoris');

    final isFavoriteSnapshot = await userFavoritesRef
        .where('annonceId', isEqualTo: annonceId)
        .limit(1)
        .get();

    final isFavorite = isFavoriteSnapshot.docs.isNotEmpty;
    
    return isFavorite;
  }

  return false; 
}
Future<CurrentUser> getUserById(String id) async =>
      await _db.collection(collection)
          .doc(id)
          .get()
          .then((doc) {
      return CurrentUser.fromDocumentSnapshot(doc);
    });
Future<bool> checkUserAndHouseInSameCollection(String userId, String houseId) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('Notification')
      .where('user.id', isEqualTo: userId)
      .where('idHouse', isEqualTo: houseId)
      .get();
print(querySnapshot.docs.isNotEmpty);
  return querySnapshot.docs.isNotEmpty;
}


}
