import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:face_net_authentication/presentation/shared/widgets/widget_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:face_net_authentication/presentation/pages/parametres/Widgets/parametres_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../core/config/app_strings.dart';

class ParametreScreen extends StatelessWidget {
  final controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Profil',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     CupertinoIcons.pencil,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.05),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 80,
                    //       width: 80,
                    //       child: const CircleAvatar(
                    //         radius: 40,
                    //         backgroundImage:
                    //             AssetImage('assets/images/Rectangle.png'),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       bottom: 0,
                    //       right: 0,
                    //       child: GestureDetector(
                    //         onTap: () {},
                    //         child: Container(
                    //           width: 35,
                    //           height: 35,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(100),
                    //             color: Colors.orange,
                    //           ),
                    //           child: const Icon(
                    //             LineAwesomeIcons.alternate_pencil,
                    //             size: 20,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ProfileMenuWidget(
                  title: controller.userData?.name ?? AppStrings.NoData,
                  icon: CupertinoIcons.person,
                  onPress: () {},
                  endIcon: false,
                ),
                ProfileMenuWidget(
                  title: controller.userData?.telephone ?? AppStrings.NoData,
                  icon: CupertinoIcons.phone,
                  onPress: () {},
                  endIcon: false,
                ),
                ProfileMenuWidget(
                  title: controller.userData?.email ?? AppStrings.NoData,
                  icon: CupertinoIcons.t_bubble,
                  onPress: () {},
                  endIcon: false,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                //menu
                // Card(
                //     color: Colors.white,
                //     elevation: 2,
                //     child: Column(
                //       children: [
                //         ProfileMenuWidget(
                //           title: "Apparence",
                //           icon: CupertinoIcons.pencil_outline,
                //           onPress: () {},
                //           endIcon: true,
                //         ),
                //         const Divider(),
                //         ProfileMenuWidget(
                //           title: "Confidentialité",
                //           icon: LineAwesomeIcons.fingerprint,
                //           onPress: () {},
                //           endIcon: true,
                //         ),
                //         const Divider(),
                //         ProfileMenuWidget(
                //           title: "Dark Mode",
                //           icon: CupertinoIcons.moon,
                //           onPress: () {},
                //           endIcon: false,
                //           toggler: true,
                //         ),
                //       ],
                //     )),

                const SizedBox(height: 5),

                Card(
                  child: ProfileMenuWidget(
                    title: "Envoyer un Feedback",
                    icon: CupertinoIcons.chat_bubble,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final TextEditingController messageController =
                              TextEditingController();
                          final TextEditingController userNameController =
                              TextEditingController();

                          return AlertDialog(
                            title: Text("Formulaire de Feedback"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                               
                                TextField(
                                  controller: messageController,
                                  decoration:
                                      InputDecoration(labelText: "Message"),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Annuler"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("Envoyer"),
                                onPressed: () async {
                                  final message = messageController.text;

                                  // Vérifiez que userName et message ne sont pas vides
                                  if (message.isNotEmpty) {
                                    // Obtenez une référence à la collection "feedback" dans Firestore
                                    final feedbackCollection = FirebaseFirestore
                                        .instance
                                        .collection('feedback');

                                    // Ajoutez le feedback à la collection
                                    await feedbackCollection.add({
                                      'controleurName':
                                          controller.userData?.name,
                                      'controleurEmail':
                                          controller.userData?.email,
                                      'controleurTel':
                                          controller.userData?.telephone,
                                      'message': message,
                                      'timestamp': FieldValue.serverTimestamp(),
                                    });
                                    Navigator.of(context).pop();

                                    showSuccessMessage(Get.context!,
                                        error: StoreError(
                                            type: "Success",
                                            errorMessage: "Merci pour votre FeedBack"));
                                  } else {
                                    // Affichez un message d'erreur si l'un des champs est vide
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Veuillez remplir tous les champs"),
                                    ));
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    endIcon: false,
                  ),
                ),

                const SizedBox(height: 10),
                ProfileMenuWidget(
                  title: "Se Deconnecter",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    _logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _logout() async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  try {
    await _firebaseAuth.signOut();
  } catch (e) {
    print('Failed to log out: $e');
    // Handle logout error
  }
}
