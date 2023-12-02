import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/domain/entities/enseignant.dart';
import 'package:face_net_authentication/presentation/components/datePicker.dart';
import 'package:face_net_authentication/presentation/components/multi_line_textfield.dart';
import 'package:face_net_authentication/presentation/components/textFieldwidget.dart';
import 'package:face_net_authentication/presentation/controllers/enseignant_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../shared/widgets/widget_error.dart';
import 'FaceID/locator.dart';
import 'FaceID/pages/sign-up.dart';
import 'FaceID/services/camera.service.dart';
import 'FaceID/services/face_detector_service.dart';
import 'FaceID/services/ml_service.dart';

class AjouterPers extends StatefulWidget {
  AjouterPers({required this.idCurentEttablissment});
  String? idCurentEttablissment;

  @override
  State<AjouterPers> createState() => _AjouterPersState();
}

class _AjouterPersState extends State<AjouterPers> {
  String? selectedStatus;
  GetStorage box = GetStorage();
  EnseignantController controller = Get.put(EnseignantController());
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController lieuNaisController = TextEditingController();
  TextEditingController fonctionController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  TextEditingController commentaireController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FilePickerResult? result;
  File? selectedFile;
  late PDFViewController pdfViewController;
  void _pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'jpg',
        'jpeg',
        'png'
      ], // Autorisez uniquement les fichiers PDF, JPG, JPEG, et PNG
    );

    if (result != null) {
      File file = File(result!.files.single.path!);
      setState(() {
        selectedFile = file;
      });
    }
  }

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Echec: $e');
  //   }
  // }

  Future<String> uploadFileToFirebase() async {
    try {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('Fichiers/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = storageReference.putFile(selectedFile!);
      await uploadTask.whenComplete(() => print('fichier Stocké'));
      final String fileUrl = await storageReference.getDownloadURL();
      return fileUrl;
    } catch (e) {
      print('Une Erreur s\'produite: $e');
      return "";
    }
  }

  static const platform = MethodChannel('Emprinte');

  Future<String> _start() async {
    String message;
    try {
      message = await platform.invokeMethod('onBnStart');
       if (message == 'Device already connected!') {
         message = await platform.invokeMethod('onBnRegister', {'strUidp': 'jhjghfhfcv'});
       }
    } on PlatformException catch (e) {
      message = 'Erreur: ${e.message}';
    }
    return message;
  }

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
              'Ajouter un membre du personnel',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.05),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: nomController,
                          height: height,
                          width: width,
                          labelText: "Nom",
                          hintText: "Kamga"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: prenomController,
                          height: height,
                          width: width,
                          labelText: "Prenom",
                          hintText: "Matthews"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: telephoneController,
                          height: height,
                          width: width,
                          textInputType: TextInputType.number,
                          labelText: "Telephone",
                          hintText: "+237 654 454 265"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: emailController,
                          height: height,
                          width: width,
                          labelText: "Email",
                          hintText: "example@gmail.com"),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DatePicker(
                          width: width,
                          height: height,
                          controller: dateController,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: lieuNaisController,
                          height: height,
                          width: width,
                          labelText: "Lieu de Naissance",
                          hintText: "Obala"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: fonctionController,
                          height: height,
                          width: width,
                          labelText: "Fonction",
                          hintText: "Fonction"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: matriculeController,
                          height: height,
                          width: width,
                          labelText: "Matricule",
                          hintText: "Matricule"),
                    ),
                    const Text(
                      "Statut",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: width * 375 / 2.1,
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: const Text("Inactif"),
                                  value: "inactif",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Actif"),
                                  value: "actif",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Malade"),
                                  value: "malade",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Décès"),
                                  value: "Décès",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Vacances"),
                                  value: "vacances",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: width * 375 / 2.1,
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: const Text("Démissionnaire"),
                                  value: "démissionnaire",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Retraité"),
                                  value: "Retraité",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Affectation"),
                                  value: "affectation",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Licencié"),
                                  value: "licencié",
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedStatus = value as String?;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Joindre document",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: GestureDetector(
                                onTap: _pickFile,
                                child: Container(
                                  width: width * 100,
                                  height: height * 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: selectedFile == null
                                        ? Colors.white
                                        : Colors.green,
                                  ),
                                  child: Center(
                                    child: selectedFile != null
                                        ? selectedFile!.path.endsWith('.pdf')
                                            ? PDFView(
                                                filePath: selectedFile!.path,
                                                autoSpacing: true,
                                                enableSwipe: true,
                                                pageSnap: true,
                                                swipeHorizontal: true,
                                                onError: (error) {
                                                  print(error);
                                                },
                                                onPageError: (page, error) {
                                                  print(
                                                      '$page: ${error.toString()}');
                                                },
                                                onViewCreated:
                                                    (PDFViewController vc) {
                                                  pdfViewController = vc;
                                                },
                                              )
                                            : Image.file(selectedFile!)
                                        : const Icon(Icons.attach_file),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(children: [
                          const Text(
                            "Scanner les empreintes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: GestureDetector(
                              onTap: () async {
                                showInformationMessage(Get.context!,
                                    error: StoreError(
                                        type: "Start",
                                        errorMessage: await _start()));
                              },
                              child: Container(
                                width: width * 100,
                                height: height * 100,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: selectedFile == null
                                      ? Colors.white
                                      : Colors.green,
                                ),
                                child: const Center(
                                  child: Icon(Icons.fingerprint),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                        MultiLineTextField(
                        height: height * 200,
                        width: width * 375,
                        controller: commentaireController,
                        hintText: "Commmentaires",
                        labelText: "Commentaires",
                        minLength: 0,
                        maxLength: 500,
                        count: false),
                    const Text(
                      "Reconnaissance faciale",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: () {
                             if (nomController.text.trim().isEmpty ||
                            prenomController.text.trim().isEmpty ||
                            emailController.text.trim().isEmpty ||
                            fonctionController.text.trim().isEmpty ||
                            lieuNaisController.text.trim().isEmpty ||
                            matriculeController.text.trim().isEmpty ||
                            telephoneController.text.trim().isEmpty ||
                            dateController.text.trim().isEmpty) {
                          // Au moins un des champs est vide, affichez un message d'erreur ou effectuez une action appropriée.
                          print('Tous les champs doivent être remplis.');
                             showErrorMessage(
                            Get.context!,
                            error: StoreError(
                              type: "Erreur",
                              errorMessage: "Tous les champs doivent être remplis",
                            ),
                          );
                          return;
                        }
                          // Créez un objet avec les données que vous souhaitez ajouter à Firestore
                          final data = {
                            'nom': nomController.text.trim(),
                            'prenom': prenomController.text.trim(),
                            'email': emailController.text.trim(),
                            'fonction': fonctionController.text.trim(),
                            'lieuNais': lieuNaisController.text.trim(),
                            'matricule': matriculeController.text.trim(),
                            'telephone': telephoneController.text.trim(),
                            'dateNais': dateController.text.trim(),
                            'idEtablissment': widget.idCurentEttablissment,
                            'status': selectedStatus
                          };

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUp(
                                data: data,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: width * 100,
                          height: height * 100,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: selectedFile == null
                                ? Colors.white
                                : Colors.green,
                          ),
                          child: const Center(
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () async {
                        if (nomController.text.trim().isEmpty ||
                            prenomController.text.trim().isEmpty ||
                            emailController.text.trim().isEmpty ||
                            fonctionController.text.trim().isEmpty ||
                            lieuNaisController.text.trim().isEmpty ||
                            matriculeController.text.trim().isEmpty ||
                            telephoneController.text.trim().isEmpty ||
                            dateController.text.trim().isEmpty) {
                          // Au moins un des champs est vide, affichez un message d'erreur ou effectuez une action appropriée.
                          print('Tous les champs doivent être remplis.');
                             showErrorMessage(
                            Get.context!,
                            error: StoreError(
                              type: "Erreur",
                              errorMessage: "Tous les champs doivent être remplis",
                            ),
                          );
                          return;
                        }

                        try {
                          final firestoreInstance = FirebaseFirestore.instance;

                          // Créez un objet avec les données que vous souhaitez ajouter à Firestore
                          final data = {
                            'nom': nomController.text.trim(),
                            'prenom': prenomController.text.trim(),
                            'email': emailController.text.trim(),
                            'fonction': fonctionController.text.trim(),
                            'lieuNais': lieuNaisController.text.trim(),
                            'matricule': matriculeController.text.trim(),
                            'telephone': telephoneController.text.trim(),
                            'dateNais': dateController.text.trim(),
                            'idEtablissment': widget.idCurentEttablissment,
                            'status': selectedStatus,
                          };

                          // Ajoutez ces données à Firestore dans la collection appropriée
                          await firestoreInstance
                              .collection('personnel')
                              .add(data);
                          showInformationMessage(
                            Get.context!,
                            error: StoreError(
                              type: "Enregister",
                              errorMessage: "Enregister avec suces",
                            ),
                          );
                          Get.back();
                          print('Données ajoutées à Firestore avec succès');
                        } catch (e) {
                          print(
                              'Erreur lors de l\'ajout des données à Firestore : $e');
                        }
                      },
                      child: Container(
                        width: width * 305,
                        height: height * 56,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(child: Text("ENREGISTRER")),
                      ),
                    )),
                  ]),
            ),
          ),
        ));
  }
}
