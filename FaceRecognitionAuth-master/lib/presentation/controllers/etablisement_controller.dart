import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/etablisement.dart';
import 'package:get/get.dart';

class EtablisementController extends GetxController {
  EtablisementController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String collection = "etablissement";

  Stream<List<EtablisementModel>> getPrevious() {
    return _db.collection(collection).snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => EtablisementModel.fromDocumentSnapshot(document))
        .toList());
  }
}
