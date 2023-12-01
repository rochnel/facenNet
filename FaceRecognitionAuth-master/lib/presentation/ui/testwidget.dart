
import 'package:face_net_authentication/presentation/shared/widgets/defaulbutton.dart';
import 'package:face_net_authentication/presentation/shared/widgets/defaultoutlinebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../shared/widgets/cardHebergeurProcheWidget.dart';
import '../shared/widgets/cardHebergeurWidget.dart';
import '../shared/widgets/text_field_widget.dart';

// ignore: must_be_immutable
class Testwidget extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 852.0);
    var width = MediaQuery.of(context).size.width * (1 / 393.0);
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: DefaulButton(
                    name: 'name', height: height, width: width, press: () {})),
            SizedBox(
              height: 10,
            ),
            Center(
                child: DefaulOutlineButton(
                    name: 'name', height: height, width: width, press: () {})),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFildWidget(
                  controller: emailController,
                  isPassword: false,
                  hintText: "Email Adress",
                  messageErro: null,
                  prefixIcon: Icons.person_outline_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width * 393,
              margin: EdgeInsets.all(10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardHebergeur(width: width, height: height),
                    CardHebergeur(width: width, height: height),
                  ],
                ),
              ),
            ),
            SizedBox(
              
              height: 10,
            ),
            CardHebergementProch(width: width, height: height),
            SizedBox(
              height: 10,
            ),
            CardHebergementProch(width: width, height: height)
          ],
        ),
      ),
    );
  }
}
