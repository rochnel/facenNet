import 'package:face_net_authentication/core/extensions/loading.dart';
import 'package:face_net_authentication/presentation/components/textFieldwidget.dart';
import 'package:face_net_authentication/presentation/controllers/login/form_controller_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';

// ignore: must_be_immutable
class LoginScreen extends GetView<FormLoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool remember = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  bool visible = true;
  void passVisible() {
    visible = !visible;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: height * 180, bottom: 10),
                  child: const Text(
                    'MES VERIFICATIONS',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Connexion',
                    style: TextStyle(fontSize: 20),
                  )),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Obx(() {
                        return TextFieldWidget(
                          controller: emailController,
                          onChanged: controller.emailChanged,
                          height: height,
                          width: width,
                          labelText: "Adresse e-mail",
                          hintText: "Adresse e-mail",
                          messageErro: controller.errorText.value,
                        );
                      }),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Obx(() {
                        return TextFieldWidget(
                          textInputType: TextInputType.visiblePassword,
                          controller: pwdController,
                          onChanged: controller.passwordChanged,
                          height: height,
                          width: width,
                          labelText: "Mot de passe",
                          hintText: "Mot de passe",
                          messageErro: controller.errorTextPass.value,
                        );
                      }),
                    ),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Mot de passe oublié?',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Obx(
                        () =>Padding(
                      padding: EdgeInsets.only(top: height * 10),
                      child:  (controller.loading.value == false)
                          ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                          onSurface: const Color.fromARGB(255, 166, 203, 233), // Disable color
                        ),
                        child: Container(
                          width: width * 305,
                          height: height * 56,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Center(
                              child:Text("Connexion")
                                 ),
                        ),
                        onPressed: controller.submitFunc.value,
                      ) : LoadingBlue(),
                    ),
                  ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
