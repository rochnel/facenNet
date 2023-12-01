import 'package:cloud_firestore/cloud_firestore.dart';
class CurrentUser {
  CurrentUser({
    this.id,
    this.name,
    this.email,
    this.prenom,
    this.quartier,
    this.status,
    this.telephone,
    this.ville,
  });

  String? id, email, name, prenom, quartier, status, telephone, ville;

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      prenom: json['prenom'],
      quartier: json['quartier'],
      status: json['status'],
      telephone: json['telephone'],
      ville: json['ville'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'prenom': prenom,
      'quartier': quartier,
      'status': status,
      'telephone': telephone,
      'ville': ville,
    };
  }

CurrentUser.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
    : id = doc.id, 
      name = doc.data()!["name"] as String?,
      email = doc.data()!["email"] as String?,
      prenom = doc.data()!["prenom"] as String?,
      quartier = doc.data()!["quartier"] as String?,
      status = doc.data()!["status"] as String?,
      telephone = doc.data()!["telephone"] as String?,
      ville = doc.data()!["ville"] as String?;

}
