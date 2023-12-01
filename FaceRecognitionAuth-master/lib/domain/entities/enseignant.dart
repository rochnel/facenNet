import 'package:cloud_firestore/cloud_firestore.dart';

class EnseignantModel {
  final String? id;
  final String nom;
  final String? prenom;
  final String telephone;
  final String dateNais;
  final String lieuNais;
  final String fonction;
  final String matricule;
   String? predictedData;
  final String email;
  EnseignantModel({
    this.id,
    required this.nom,
    this.prenom,
    required this.dateNais,
this.predictedData,
    required this.email,
    required this.lieuNais,
    required this.matricule,
    required this.telephone,
    required this.fonction,
  });

  factory EnseignantModel.fromJson(Map<String, dynamic>? json) {
    return EnseignantModel(
      nom: json?['nom'] as String,
      prenom: json?['prenom'] as String,
      id: json?['id'] as String?,
      fonction: json?['fonction'] as String,
      email: json?['email'] as String,
      matricule: json?['matricule'] as String,
      telephone: json?['telephone'] as String,
      dateNais: json?['dateNais'] as String,
      
       predictedData: json?['predictedData'] as String,
      lieuNais: json?['lieuNais'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'prenom': prenom,
        'datenais': dateNais,
        'lieuNais': lieuNais,
        'fonction': fonction,
        'email': email,
        'matricule': matricule,
        'telephone': telephone,
        'predictedData': predictedData
      };

  EnseignantModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nom = doc.data()!["nom"],
        prenom = doc.data()!["prenom"],
        lieuNais = doc.data()!["fonction"],
        dateNais = doc.data()!["lieuNais"],
        fonction = doc.data()!["dateNais"],
        predictedData = doc.data()!["predictedData"],
        email = doc.data()!["email"],
        matricule = doc.data()!["matricule"],
        telephone = doc.data()!["telephone"];
}

// final List<EnseignantModel> lEnseignant = [
//   EnseignantModel(
//     nom: "Atangana",
//     prenom: "Giselle",
//     dateNais: "12/05/1968",
//     email: "giselle@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Kamga",
//     prenom: "Bernard",
//     dateNais: "12/05/1968",
//     email: "Kamga@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Fosso",
//     prenom: "Martial",
//     dateNais: "12/05/1968",
//     email: "Fosso@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Edima",
//     prenom: "Giselle",
//     dateNais: "12/05/1968",
//     email: "Edima@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Yontou",
//     prenom: "pascal",
//     dateNais: "12/05/1968",
//     email: "Yontou@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//    EnseignantModel(
//     nom: "Kamga",
//     prenom: "Bernard",
//     dateNais: "12/05/1968",
//     email: "Kamga@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Fosso",
//     prenom: "Martial",
//     dateNais: "12/05/1968",
//     email: "Fosso@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Edima",
//     prenom: "Giselle",
//     dateNais: "12/05/1968",
//     email: "Edima@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
//   EnseignantModel(
//     nom: "Yontou",
//     prenom: "pascal",
//     dateNais: "12/05/1968",
//     email: "Yontou@gmail.com",
//     lieuNais: "Obala",
//     matricule: "ENS-0032658",
//     telephone: "+237 657 265 354",
//     image: "assets/images/Rectangle.png",
//     fonction: "Lorem , ",
//   ),
// ];
