import 'dart:async';

import 'package:camera/camera.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/pages/widgets/auth_button.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/pages/widgets/camera_detection_preview.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/pages/widgets/camera_header.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/pages/widgets/signin_form.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/pages/widgets/single_picture.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/enseignant.dart';
import '../locator.dart';
import '../services/camera.service.dart';
import '../services/face_detector_service.dart';
import '../services/ml_service.dart';
import 'models/user.model.dart';

class SignIn extends StatefulWidget {
   SignIn({Key? key, this.enseignant}) : super(key: key);
  EnseignantModel? enseignant;
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  CameraService _cameraService = locator<CameraService>();
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  MLService _mlService = locator<MLService>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isPictureTaken = false;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _mlService.dispose();
    _faceDetectorService.dispose();
    super.dispose();
  }

  Future _start() async {
    setState(() => _isInitializing = true);
    await _cameraService.initialize();
    setState(() => _isInitializing = false);
    _frameFaces();
  }

  _frameFaces() async {
    bool processing = false;
    _cameraService.cameraController!
        .startImageStream((CameraImage image) async {
      if (processing) return; // prevents unnecessary overprocessing.
      processing = true;
      await _predictFacesFromImage(image: image);
      processing = false;
    });
  }

  Future<void> _predictFacesFromImage({@required CameraImage? image}) async {
    assert(image != null, 'Image is null');
    await _faceDetectorService.detectFacesFromImage(image!);
    if (_faceDetectorService.faceDetected) {
      _mlService.setCurrentPrediction(image, _faceDetectorService.faces[0]);
    }
    if (mounted) setState(() {});
  }

  Future<void> takePicture() async {
    if (_faceDetectorService.faceDetected) {
      await _cameraService.takePicture();
      setState(() => _isPictureTaken = true);
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text('Aucun visage détecté')));
    }
  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  _reload() {
    if (mounted) setState(() => _isPictureTaken = false);
    _start();
  }

  Future<void> onTap() async {
    await takePicture();
    if (_faceDetectorService.faceDetected) {
      EnseignantModel? user = await _mlService.predict(widget.enseignant!);
      var bottomSheetController = scaffoldKey.currentState!
          .showBottomSheet((context) => signInSheet(user: user));
      bottomSheetController.closed.whenComplete(_reload);
    }
  }

  Widget getBodyWidget() {
    if (_isInitializing) return Center(child: CircularProgressIndicator());
    if (_isPictureTaken)
      return SinglePicture(imagePath: _cameraService.imagePath!);
    return CameraDetectionPreview();
  }

  @override
  Widget build(BuildContext context) {
    Widget header = CameraHeader("VERIFICATION", onBackPressed: _onBackPressed);
    Widget body = getBodyWidget();
    Widget? fab;
    if (!_isPictureTaken) fab = AuthButton(onTap: onTap);

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [body, header],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: fab,
    );
  }

  signInSheet({@required EnseignantModel? user}) => user == null
      ? Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Text(
            'Personnel inconnu',
            style: TextStyle(fontSize: 20),
          ),
        )
      : SignInSheet(user: user);
}
