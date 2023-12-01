import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/personnels/FaceID/pages/sign-in.dart';

class CardEnseignant extends StatelessWidget {
  const CardEnseignant({
    required this.enseignant,
  });

  final EnseignantModel enseignant;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Verification"),
              content: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quelle Methode souhaitez vous utiliser pour verifier cette personne ?",
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.fingerprint,
                                  size: 60,
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SignIn(enseignant: enseignant,),
                                ),
                              );
                            },
                            child: Card(
                              child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Icon(
                                    Icons.face_6,
                                    size: 60,
                                  )),
                            ),
                          ),
                          Card(
                            child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.person_off,
                                  size: 60,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("ANNULER"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 8,right: 8, top: 4),
         child: Column(
          children: [
            Card(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/person.png"),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(enseignant.nom,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Icon(Icons.pending_actions),
                                    Text(
                                      enseignant.fonction,
                                      textAlign: TextAlign.start,
                                    ),
                                  ]),
                                  Row(children: [
                                    const Icon(Icons.numbers),
                                    Text(
                                      enseignant.matricule,
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Icon(Icons.phone),
                                    Text(
                                      enseignant.telephone,
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardRapport extends StatelessWidget {
  const CardRapport({
    required this.enseignant,
  });

  final EnseignantModel enseignant;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: width * 171 / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     padding: const EdgeInsets.all(8.0),
              //     child: CircleAvatar(
              //       radius: 40,
              //       backgroundImage: AssetImage(enseignant.image!),
              //     )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(enseignant.nom,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            //   const SizedBox(
                            //     width: 10,
                            //   ),
                            //   Text(enseignant.prenom!,
                            //       textAlign: TextAlign.center,
                            //       style: const TextStyle(
                            //           fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Center(
                          child: Text(enseignant.fonction),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              enseignant.matricule,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              enseignant.telephone,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Text("Statut :"),
                    const SizedBox(width: 5),
                    Container(
                        height: height * 20,
                        width: width * 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange),
                        child: null),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
