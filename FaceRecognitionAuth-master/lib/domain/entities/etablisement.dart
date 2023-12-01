import 'package:cloud_firestore/cloud_firestore.dart';

class EtablisementModel {
  final String? id;
  final String? name;
  final String? departement;
  final String? status;
  final String? ville;
  EtablisementModel({
    this.id,
    this.name,
    this.departement,
    this.status,
    this.ville,
  });

  factory EtablisementModel.fromJson(Map<String, dynamic>? json) {
    return EtablisementModel(
      name: json?['name'] as String,
      id: json?['id'] as String?,
      status: json?['status'] as String,
      ville: json?['ville'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'departement': departement,
        'status': status,
        'ville': ville,
      };

  EtablisementModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["id"],
        name = doc.data()!["name"],
        departement = doc.data()!["departement"],
        status = doc.data()!["status"],
        ville = doc.data()!["ville"];
}
