import 'package:face_net_authentication/domain/entities/etablisement.dart';
import 'package:face_net_authentication/domain/entities/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AffectationModel {
  String? id;
  EtablisementModel? etablissement;
  CurrentUser? controleur;
  String? status;

  AffectationModel({
    this.id,
    this.etablissement,
    this.controleur,
    this.status,
  });

  factory AffectationModel.fromJson(Map<String, dynamic> json) {
    return AffectationModel(
      id: json['id'],
      etablissement: EtablisementModel.fromJson(json['etablissement']),
      controleur: CurrentUser.fromJson(json['controleur']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'etablissement': etablissement?.toJson(),
      'controleur': controleur?.toJson(),
      'status': status,
    };
  }

  factory AffectationModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
  final data = doc.data()!;
  final id = doc.id;

  return AffectationModel(
    id: id,
    etablissement: EtablisementModel.fromJson(data['etablissement']),
    controleur: CurrentUser.fromJson(data['controleur']),
    status: data['status'] as String?,
  );
}

}

