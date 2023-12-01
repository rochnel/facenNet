import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../shared/widgets/widget_error.dart';
import '../../locator.dart';
import '../../services/camera.service.dart';
import '../../services/ml_service.dart';
import 'app_button.dart';

class AuthActionButton extends StatefulWidget {
  AuthActionButton(
      {Key? key,
      required this.onPressed,
      required this.data,
      this.imagePath,
      this.enseignant,
      required this.isLogin,
      required this.reload});
  final Function onPressed;
  final bool isLogin;
  final Map<String, dynamic> data;
  EnseignantModel? enseignant;
  String? imagePath;

  final Function reload;
  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  final MLService _mlService = locator<MLService>();
  final CameraService _cameraService = locator<CameraService>();

  final TextEditingController _userTextEditingController =
      TextEditingController(text: '');
  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: '');

  EnseignantModel? predictedUser;

  Future _signUp(context) async {
    final firestoreInstance = FirebaseFirestore.instance;
    List<dynamic> predictedData = _mlService.predictedData;

    // Convertir la liste en JSON
    String predictedDataJson = jsonEncode(predictedData);
    print(widget.imagePath);
    // Upload de l'image sur Firebase Storage
    String imageUrl = await uploadImage(widget.imagePath!);

    // Ajouter l'URL de l'image aux données
    Map<String, dynamic> data = widget.data;
    data['predictedData'] = predictedDataJson;
    data['imageUrl'] = imageUrl;

    try {
      _showLoadingDialog(context);

      // Ajouter les données à Firestore
      await firestoreInstance.collection('personnel').add(data);

      showInformationMessage(Get.context!,
          error: StoreError(
              type: "Enregister", errorMessage: "Enregister avec succès"));
      Get.back();
      print('Données ajoutées à Firestore avec succès');
    } catch (e) {
      print('Erreur lors de l\'ajout des données à Firestore : $e');
      Navigator.of(context, rootNavigator: true).pop();
    }

    // Réinitialiser les données prédites
    this._mlService.setPredictedData([]);

    // Fermer la page
    Get.back();
  }

  Future<String> uploadImage(String filePath) async {
    File file = File(filePath);
    //String fileName = basename(file.path);

    // Référence du fichier dans Firebase Storage
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/personnel');

    // Télécharger le fichier
    UploadTask uploadTask = storageReference.putFile(file);
    TaskSnapshot snapshot = await uploadTask;

    // Obtenir l'URL de téléchargement
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print('Image téléchargée avec succès. URL : $downloadUrl');

    return downloadUrl;
  }

  Future _signIn(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Controller'),
        );
      },
    );
  }

  Future<EnseignantModel?> _predictUser() async {
    EnseignantModel? userAndPass = await _mlService.predict(widget.enseignant);
    return userAndPass;
  }

  Future onTap() async {
    try {
      bool faceDetected = await widget.onPressed();
      if (faceDetected) {
        if (widget.isLogin) {
          var user = await _predictUser();
          if (user != null) {
            this.predictedUser = user;
          }
        }
        PersistentBottomSheetController bottomSheetController =
            Scaffold.of(context)
                .showBottomSheet((context) => signSheet(context));
        bottomSheetController.closed.whenComplete(() => widget.reload());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CAPTURE',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLogin && predictedUser != null
              ? Container(
                  child: Text(
                    'Welcome back, ' + predictedUser!.nom + '.',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : widget.isLogin
                  ? Container(
                      child: Text(
                      'User not found',
                      style: TextStyle(fontSize: 20),
                    ))
                  : Container(),
          Container(
            child: Column(
              children: [
                widget.isLogin && predictedUser != null
                    ? AppButton(
                        text: 'VERIFICATION',
                        onPressed: () async {
                          _signIn(context);
                        },
                        icon: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      )
                    : !widget.isLogin
                        ? AppButton(
                            text: 'TERMINER',
                            onPressed: () async {
                              await _signUp(context);
                            },
                            icon: Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Empêche de fermer le dialogue en cliquant en dehors
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Chargement..."),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
