import 'package:face_net_authentication/domain/entities/etablisement.dart';
import 'package:face_net_authentication/presentation/components/Drawer.dart';
import 'package:face_net_authentication/presentation/controllers/etablisement_controller.dart';
import 'package:face_net_authentication/presentation/pages/alerts/alerts_screen.dart';
import 'package:face_net_authentication/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:face_net_authentication/presentation/pages/parametres/parametres_screen.dart';
import 'package:face_net_authentication/presentation/shared/widgets/widget_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/entities/affectation_model.dart';

class HomePage extends StatelessWidget {
  
  final controller2 = Get.find<DashboardController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    EtablisementController? controller;
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MultiLevelDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 50.0,
                        height: 50.0,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon:
                                Icon(Ionicons.menu_sharp, color: Colors.orange),
                          ),
                        ),
                      ),
                      Text(
                        "MES VERIFICATIONS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
              Container(
                  width: width * 171 * 2,
                  height: height * 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 255, 218, 163)),
                  child: Center(
                    child: Text(
                      "Bienvenue ${controller2.userData?.name}.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )),
              //  Padding(
              //   padding: EdgeInsets.symmetric(vertical: 8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Statistiques",
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: width * 171 * 2,
              //   height: height * 150,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.deepOrange),
              //   child: Center(child: Text("Stats")),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
