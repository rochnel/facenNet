import 'package:face_net_authentication/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:face_net_authentication/presentation/pages/gestion/gestion.dart';
import 'package:face_net_authentication/domain/entities/etablisement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login/form_binding_login.dart';
import '../pages/login/loginScreen.dart';
import '../pages/parametres/parametres_screen.dart';
import '../pages/personnels/FaceID/locator.dart';

class MultiLevelDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    var width = MediaQuery.of(context).size.width * (1 / 393.0);
    return Drawer(
      child: Column(
        children: [
          Container(
            width: width * 300,
            height: 100,
          ),
          const Text(
            'MENU ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                // ... Autres éléments de menu
                MLMenuItem(
                  icon: Icons.person,
                  content: const Text('Profil'),
                  onTap: () {
                    print(controller.userData!.id!);
                    Get.to(ParametreScreen());
                  },
                  subMenuItems: [], // Pas de sous-menu
                ),
                //Enveloppez le menu des événements dans un ExpansionTile
                ExpansionTile(
                  leading: const Icon(Icons.event),
                  title: const Text(
                    'Affectations',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    FutureBuilder(
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                '${snapshot.error} occurred',
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            final annees = snapshot.data as List<String>;
                            return Column(
                              children: annees.map((e) {
                                return ExpansionTile(
                                  leading: const Icon(Icons.event_available),
                                  title: Text(e),
                                  children: [
                                    FutureBuilder(
                                      builder: (ctx, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return Center(
                                              child: Text(
                                                '${snapshot.error} occurred',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            );
                                          } else if (snapshot.hasData) {
                                            final Mois =
                                                snapshot.data as List<String>;
                                            return Column(
                                              children: Mois.map((m) {
                                                return ExpansionTile(
                                                  leading: const Icon(
                                                      Icons.event_available),
                                                  title: Text(m),
                                                  children: [
                                                    FutureBuilder(
                                                      builder: (ctx, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .done) {
                                                          if (snapshot
                                                              .hasError) {
                                                            return Center(
                                                              child: Text(
                                                                '${snapshot.error} occurred',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            );
                                                          } else if (snapshot
                                                              .hasData) {
                                                            final Etabs = snapshot
                                                                    .data
                                                                as List<
                                                                    EtablisementModel>;
                                                            return Column(
                                                              children:
                                                                  Etabs.map(
                                                                      (et) {
                                                                return ListTile(
                                                                    leading: const Icon(
                                                                        Icons
                                                                            .event_available),
                                                                    title: Text(
                                                                        et.name!),
                                                                    onTap: () {
                                                                       (Get.to(
                                                                          Gestion(
                                                                        idCurentEttablissment:
                                                                            et.id,
                                                                      )));
                                                                    });
                                                              }).toList(),
                                                            );
                                                          }
                                                        }
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      },
                                                      future: controller.store
                                                          .getEtablisement(
                                                              idControleur:
                                                                  controller
                                                                      .userData!
                                                                      .id!,
                                                              annee: e,
                                                              mois: m),
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                            );
                                          }
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      future: controller.store.getMois(
                                          idControleur:
                                              controller.userData!.id!,
                                          annee: e),
                                    ),
                                  ],
                                );
                              }).toList(),
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      future: controller.store
                          .getAnnee(idControleur: controller.userData!.id!),
                    ),
                  ],
                ),

                MLMenuItem(
                  icon: Icons.exit_to_app,
                  content: const Text('Deconnexion'),
                  onTap: () {
                    () {
                      print("object");
                      FormLoginBinding().dependencies();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    };
                  },
                  subMenuItems: [], // Pas de sous-menu
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MLMenuItem extends StatelessWidget {
  final IconData icon;
  final Widget content;
  final List<MLSubMenuItem> subMenuItems;
  final void Function()? onTap;

  MLMenuItem(
      {required this.icon,
      required this.content,
      required this.subMenuItems,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return subMenuItems.isNotEmpty
        ? ExpansionTile(
            leading: Icon(icon),
            title: content,
            children: subMenuItems,
          )
        : ListTile(leading: Icon(icon), title: content, onTap: onTap);
  }
}

class MLSubMenuItem extends StatelessWidget {
  final IconData icon;
  final Widget content;
  final void Function()? onTap;

  MLSubMenuItem({
    required this.icon,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: content, onTap: onTap);
  }
}
