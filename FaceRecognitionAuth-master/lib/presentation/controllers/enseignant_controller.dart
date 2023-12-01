import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:face_net_authentication/presentation/shared/device/device_utils.dart';
import 'package:face_net_authentication/presentation/shared/widgets/widget_error.dart';
import 'package:get/get.dart';

class EnseignantController extends GetxController {
  EnseignantController();

  Future<bool> Function() addEnseignant(EnseignantModel ens) {
    return () async {
      await Future.delayed(const Duration(seconds: 1), () async {
        try {
          DeviceUtils.hideKeyboard(Get.context!);
          final CollectionReference collection =
              FirebaseFirestore.instance.collection('personnel');

          await collection.add({
            'nom': ens.nom,
            'prenom': ens.prenom,
            'dateNais': ens.dateNais,
            'email': ens.email,
            'lieuNais': ens.lieuNais,
            'matricule': ens.matricule,
            'telephone': ens.telephone,
            'fonction': ens.fonction,
          });
           showInformationMessage(Get.context!,
              error: StoreError(
                  type: "Enregister",
                  errorMessage: "Enregister avec suces"));
        } catch (error) {
          print("Erreur !!");
          showInformationMessage(Get.context!,
              error: StoreError(
                  type: "Erreur lors de la creation",
                  errorMessage: "Verifier les informations svp!"));
        }
      });
      return true;
    };
  }
}
