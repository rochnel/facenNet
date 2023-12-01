import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:face_net_authentication/domain/entities/etablisement.dart';


import '../../domain/entities/affectation_model.dart';

class AffectationServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collection = "affectation";

  Stream<AffectationModel?> getCurrentAffectation(
      {required String idControleur}) {
    return _db
        .collection(collection)
        .where("controleur.id", isEqualTo: idControleur)
        .where("status", isEqualTo: "Active")
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print("reponse ok affectation");
        return AffectationModel.fromDocumentSnapshot(snapshot.docs.first);
      } else {
        print("reponse null");
        return null;
      }
    });
  }

  Stream<List<AffectationModel>> getPrecedenteffectation(
      {required String idControleur}) {
    return _db
        .collection(collection)
        .where("controleur.id", isEqualTo: idControleur)
        .where("status", isEqualTo: "Close")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => AffectationModel.fromDocumentSnapshot(document))
            .toList());
  }

  Stream<List<EnseignantModel>> getPersonnel({required String idEtablissment}) {
    return _db
        .collection('personnel')
        .where("idEtablissment", isEqualTo: idEtablissment)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => EnseignantModel.fromDocumentSnapshot(document))
            .toList());
  }

Future<List<String>> getAnnee({required String idControleur}) async {
  Set<String> annee = {}; // Utiliser un Set au lieu d'une liste

  try {
    final QuerySnapshot Qr = await _db
        .collection(collection)
        .where("controleur.id", isEqualTo: idControleur)
        .get();
    
    Qr.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final an = data['annee'];
      if (an != null) {
        annee.add(an);
      }
    });
  } catch (e) {
    print("Une erreur s'est produite : $e");
  }

  // Convertir le Set en une liste avant de le retourner
  return annee.toList();
}


 Future<List<String>> getMois({required String idControleur, required String annee}) async {
  Set<String> months = {}; // Utiliser un Set au lieu d'une liste

  try {
    final QuerySnapshot Qr = await _db
        .collection(collection)
        .where("controleur.id", isEqualTo: idControleur)
        .where("annee", isEqualTo: annee)
        .get();

    Qr.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final mois = data['mois'];
      if (mois != null) {
        months.add(mois);
      }
    });
  } catch (e) {
    print("Une erreur s'est produite : $e");
  }

  // Convertir le Set en une liste avant de le retourner
  return months.toList();
}


 Future<List<EtablisementModel>> getEtablisement({
  required String idControleur,
  required String annee,
  required String mois,
}) async {
  List<EtablisementModel> schools = [];
  try {
    final QuerySnapshot Qr = await _db
        .collection(collection)
        .where("controleur.id", isEqualTo: idControleur)
        .where("annee", isEqualTo: annee)
        .where("mois", isEqualTo: mois)
        .get();
    
    Qr.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final etablissementData = data['etablissement']; // Assurez-vous que c'est le bon champ pour l'établissement
      if (etablissementData != null) {
        final etablissement = EtablisementModel.fromJson(etablissementData); // Remplacez 'EtablisementModel.fromJson' par la méthode appropriée pour créer un modèle d'établissement depuis les données.
        schools.add(etablissement);
      }
    });
  } catch (e) {
    print("Une erreur s'est produite : $e");
  }
  return schools;
}

}
