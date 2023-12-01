import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class Database extends GetxController {
  FirebaseFirestore? firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  // Future updateUser(CurrentUser user) async {
  //   try {
  //     await firestore!.collection("USERS").doc(user.id).update({
  //       'phone': user.phone,
  //       //'country': user.country,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
