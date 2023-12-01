import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:face_net_authentication/presentation/components/card_enseignant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/etablisement_controller.dart';
import '../../shared/widgets/widget_error.dart';
import '../dashboard/dashboard_controller.dart';
import '../personnels/FaceID/locator.dart';
import '../personnels/FaceID/services/camera.service.dart';
import '../personnels/FaceID/services/face_detector_service.dart';
import '../personnels/FaceID/services/ml_service.dart';
import '../personnels/add_personnel.dart';

class Gestion extends StatefulWidget {
   Gestion({required this.idCurentEttablissment});
String? idCurentEttablissment;
  @override
  State<Gestion> createState() => _GestionState();
}

class _GestionState extends State<Gestion> {
  GetStorage box = GetStorage();
  // String idCurentEttablissment = "";
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   idCurentEttablissment = box.read('CurrentEtablissement');
  //   super.initState();
  // }
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }
  @override
  Widget build(BuildContext context) {
    final controller2 = Get.find<DashboardController>();
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Gestion des Presences',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 812,
          width: width * 375,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.05),
          ),
          child: StreamBuilder(
            // ignore: dead_code
            stream: controller2.store
                .getPersonnel(idEtablissment: widget.idCurentEttablissment!),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (streamSnapshot.connectionState ==
                      ConnectionState.active ||
                  streamSnapshot.connectionState == ConnectionState.done) {
                if (streamSnapshot.hasData) {
                  List<EnseignantModel> listEtab =
                      streamSnapshot.data as List<EnseignantModel>;
                  return listEtab.isEmpty
                      ? Center(
                          child: buildText(
                              "Aucun Personnel dans cette etablisement"))
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listEtab.length,
                          itemBuilder: (context, index) {
                            final Ens = listEtab[index];
                            print(listEtab[index].predictedData );
                            return CardEnseignant(enseignant: Ens, );
                          },
                        );
                } else if (streamSnapshot.hasError) {
                  return Center(
                      child: buildText('Something Went Wrong Try later'));
                } else {
                  return Center(
                      child: buildText('Something Went Wrong Try later'));
                }
              } else {
                return Center(
                    child:
                        buildText('State: ${streamSnapshot.connectionState}'));
              }
            },
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){
      //     setupServices();
          Get.to(AjouterPers(idCurentEttablissment: widget.idCurentEttablissment,));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
