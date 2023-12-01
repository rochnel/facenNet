
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../domain/entities/enseignant.dart';
import '../../locator.dart';
import '../../services/camera.service.dart';
import '../models/user.model.dart';
import '../profile.dart';
import 'app_button.dart';
import 'app_text_field.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final EnseignantModel user;

  final _passwordController = TextEditingController();
  final _cameraService = locator<CameraService>();

  // Future _signIn(context, user) async {
  //   if (user.password == _passwordController.text) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => Profile(
  //                   user.user,
  //                   imagePath: _cameraService.imagePath!,
  //                 )));
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text('Wrong password!'),
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Authentifer avec sucess! \n Nom: ' + user.nom + '\n Status: Present',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
               
                Divider(),
                SizedBox(height: 10),
                AppButton(
                  text: 'TERMINER',
                  onPressed: () async {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
